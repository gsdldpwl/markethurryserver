package com.test.crawler;

import java.beans.Statement;


import java.io.BufferedReader;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.test.user.main.DBUtil;

import org.json.*;

/**
 * @author leeho
 * 마켓허리 상품 데이터 크롤러
 */
public class ProductDummy {

	public static void main(String[] args) {

		// httpURLConnection 객체 생성
		ProductDummy httpConn = new ProductDummy();
		DBUtil util = new DBUtil();

		// 카테고리 번호
		// https://api.kurly.com/v1/categories 해당 URL 접속 시 카테고리 번호를 확인 가능.(Chrome 확장
		// 프로그램에서 JSON Viewer를 설치)

		String[] categoryNumList = {"907","908","909","910","912003","913003","914003","032","914001"};

		// 지정한 카테고리의 상품 목록 페이지를 돌며 각 상품의 고유번호를 가져오는 코드, 이 과정까지 완료되면 위에 선언한 리스트에 상품의 고유번호
		// 저장 완료
		for (int i = 0; i < categoryNumList.length; i++) {
			// 상품 고유코드가 들어갈 리스트
			ArrayList<product> goodsList = new ArrayList<product>();
			// 한 카테고리의 전체 페이지를 돈다.
			httpConn.get(categoryNumList[i],
					String.format("https://api.kurly.com/v1/categories/%s?page_limit=99&page_no=1", categoryNumList[i]),
					goodsList);
			getContent(goodsList);

			// insert
			Connection conn = util.open();

			for (product product : goodsList) {
				try {
					insert(product, conn);
				} catch (SQLException e) {
					System.out.println(product.getContent());
					e.printStackTrace();
				}

			}
			System.out.println("insert complete");

		}
	}

	private static void insert(product product, Connection conn) throws SQLException {

		PreparedStatement stat = null;
		String sql = "insert into product values (seqproduct.nextVal,?,?,?,?,?,'20190101',?,default,default)";
		stat = conn.prepareStatement(sql);

		stat.setString(1, product.getName());
		stat.setString(2, product.getShortdesc().length() == 0 ? "no shortdesc" : product.getShortdesc());
		stat.setString(3, product.getContent().replace("\r\n", "<br>"));
		stat.setInt(4, product.getCategory());
		stat.setInt(5, product.getPrice());
		stat.setString(6, product.getImgurl());

		int result = stat.executeUpdate();
		stat.close();
	}

	private static void getContent(ArrayList<product> goodsList) {
		/*
		 * 35:까지는 현재 마켓컬리에서 사용중인 Rest api를 통해 각 카테고리의 상품 고유코드를 가져오는 코드 httpURLConnection
		 * 클래스를 사용하였고, 마켓컬리 rest api를 호출하는 get(String url, ArrayList<Integer>)이라는 메소드로
		 * 진행했음
		 * 
		 * 아래 코드부터는 Jsoup 라이브러리를 이용하여 작성했음
		 * 
		 */

		// 저장한 고유번호 배열 탐색
		for (int i = 0; i < goodsList.size(); i++) {
			// url

			String url = String.format("https://www.kurly.com/shop/goods/goods_view.php?&goodsno=%d",
					goodsList.get(i).getNum());
			Document doc = null;

			try {
				doc = Jsoup.connect(url).get();

				// get element
				// 해당 코드부터 Jsoup api를 사용하여 원하는 태그들을 가져오는 코드 작성
				Elements element = doc.select("p.words");
				// add url on list
				String words = "";
				for (Element el : element) {
					words += el.text();
				}
				// 본문내용 가져오기
				if(words.length() > 0) {
					goodsList.get(i).setContent(words);
				} else {
					goodsList.get(i).setContent("no contents");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(">>>>>>>> 크롤링 완료");
	}

	public void get(String categorynum, String strUrl, ArrayList<product> arrayList) {

		try {
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(5000); // 서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
			con.setRequestMethod("GET");

			// URLConnection에 대한 doOutput 필드값을 지정된 값으로 설정한다.
			// URL 연결은 입출력에 사용될 수 있다.
			// URL 연결을 출력용으로 사용하려는 경우 DoOutput 플래그를 true로 설정하고, 그렇지 않은 경우는 false로 설정해야 한다.
			// 기본값은 false이다.

			con.setDoOutput(false);

			// 상품의 고유번호를 넣을 리스트 선언

			// json parser
			JSONParser parser = new JSONParser();

			// url 요청을 성공했을 때
			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line = "";
				JSONObject jsonObj = null;

				// api를 통해 가져온 json 형식의 string을 변수에 넣어줌
				while ((line = br.readLine()) != null) {
					jsonObj = (JSONObject) parser.parse(line);
				}
				br.close();

				// 가져온 json data중 상품의 정보가 들어있는 products만 선택해줌
				JSONArray data = (JSONArray) ((JSONObject) jsonObj.get("data")).get("products");
				// 상품의 길이만큼 돌면서 상품의 고유번호 추출 후 리스트에 삽입
				if (data.size() > 0) {
					for (int i = 0; i < data.size(); i++) {

						product tempProduct = new product();
						
						String dataStr = data.get(i).toString();
						// num
						String goodsNum = dataStr.substring(dataStr.indexOf("no"), dataStr.indexOf(","))
								.replace("\"", "").replace("no", "").replace(":", "");
						// img
						String imgpath = dataStr.substring(dataStr.indexOf("thumbnail_image_url"));
						String imgpath2 = imgpath.substring(0, imgpath.indexOf(",")).replace("thumbnail_image_url", "")
								.replace("\\", "").replace("\"", "").substring(1);

						// name
						String nameTemp = dataStr.substring(dataStr.lastIndexOf("name"), dataStr.length() - 2)
								.replace(",", "");
						String nameTemp2 = nameTemp.replace("name", "").replace(":", "").replace("\"", "");
						String nameTemp3 = "";
						
						if (nameTemp2.indexOf("d") > 0) {
							nameTemp3 = nameTemp2.substring(0, nameTemp2.indexOf("d"));
						} else {
							nameTemp3 = nameTemp2;
						}

						// price
						String priceTemp = dataStr.substring(dataStr.indexOf("original_price"));
						String priceTemp2 = priceTemp.substring(0, priceTemp.indexOf(",")).replace("original_price", "")
								.replace("\"", "").replace(":", "");

						// shortdesc
						String shortdescTemp = dataStr.substring(dataStr.indexOf("shortdesc"));
						String shortdescTemp2 = shortdescTemp.substring(0, shortdescTemp.indexOf(","))
								.replace("shortdesc", "").replace("\"", "").replace(":", "");

						// setter
						tempProduct.setNum(Integer.parseInt(goodsNum));
						tempProduct.setName(nameTemp3);
						tempProduct.setPrice(Integer.parseInt(priceTemp2));
						tempProduct.setShortdesc(shortdescTemp2);
						tempProduct.setImgurl(imgpath2);

						// category
						if (categorynum.equals("907")) {
							// 채소
							tempProduct.setCategory(0);
						} else if (categorynum.equals("908")) {
							// 과일
							tempProduct.setCategory(1);
						} else if (categorynum.equals("910")) {
							// 육류
							tempProduct.setCategory(2);
						} else if (categorynum.equals("909")) {
							// 수산
							tempProduct.setCategory(3);
						} else if (categorynum.equals("912003")) {
							tempProduct.setCategory(4);
						} else if (categorynum.equals("913003")) {
							tempProduct.setCategory(5);
						} else if (categorynum.equals("914003")) {
							tempProduct.setCategory(6);
						} else if (categorynum.equals("032")) {
							tempProduct.setCategory(7);
						} else if (categorynum.equals("914001")) {
							tempProduct.setCategory(8);
						}
						arrayList.add(tempProduct);
					}
					System.out.println(">>>>>>>>>> 상품 고유번호 추가 완료");

				}
			}

			else {
				System.out.println(con.getResponseMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

