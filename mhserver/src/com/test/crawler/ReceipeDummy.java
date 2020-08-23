package com.test.crawler;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.test.user.main.DBUtil;

public class ReceipeDummy {

	public static void main(String[] args) {
		Random rnd = new Random();
		DBUtil util = new DBUtil();
		
		for (int i = 1; i <= 8; i++) {

			String url = String.format("https://www.kurly.com/shop/board/list.php?id=recipe&page=%d", i);
			String reciepeDomain = "https://www.kurly.com/shop/board/";

			ArrayList<String> urlList = new ArrayList<String>();

			Document doc = null;

			try {

				doc = Jsoup.connect(url).get();

			} catch (IOException e) {
				e.printStackTrace();
			}
			// get element
			Elements element = doc.select("li.recipe_item > a");

			// page list
			ArrayList<String> productPage = new ArrayList<String>();

			// add url on list
			for (Element el : element) {
				urlList.add(reciepeDomain + el.attr("href"));
			}

			for (String eachUrl : urlList) {

				// variable

				// connect on page
				try {
					doc = Jsoup.connect(eachUrl).get();
					Elements subjects = doc.select("small.recipe_product");
					Elements contents = doc.select("p.words");
					
					Elements regdates = doc.select("span.td");
					Elements images = doc.select("div.pic > img");

					Receipe receipe = new Receipe();
					
					receipe.setMemberSeq(rnd.nextInt(1000)+1);
					receipe.setCategory(rnd.nextInt(5));
					
					for (Element subject : subjects) {
						receipe.setTitle(subject.text());
					}
					for (Element content : contents) {
						receipe.setContent(content.outerHtml().replace("<p class=\"words\"> <strong class=\"recipe_item_tit\">","").replace("</strong>", "").replace("</b>","").replace("<b>","").replace("</br>","").replace("</p>", ""));
					}

					boolean flag = true;
					for (Element date : regdates) {
						if (flag) {
							receipe.setRegdate(date.text());
							flag = false;
						} else {
							receipe.setReadcount(Integer.parseInt(date.text()));
						}

					}
					for (Element img : images) {
						receipe.setImgpath(img.attr("src"));
					}
					System.out.println(receipe.getTitle());
					System.out.println(receipe.getImgpath());
					System.out.println("crawling end");
					
					Connection conn = util.open();
//					insert(receipe, conn);
					update(receipe,conn);
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}

		}
	}
	
	private static void update(Receipe receipe, Connection conn) {
		PreparedStatement stat = null;
		
		String sql = "update receipe set content=? where title=?";
		String img = receipe.getImgpath();
		try {
			stat = conn.prepareStatement(sql);
			stat.setString(1, receipe.getContent());
			stat.setString(2, receipe.getTitle());
			
			stat.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static void insert(Receipe receipe, Connection conn) throws SQLException {

		PreparedStatement stat = null;
		String sql = "insert into receipe values (seqreceipe.nextVal,?,?,?,?,?,?,?,default)";
		
		stat = conn.prepareStatement(sql);
		stat.setInt(1, receipe.getMemberSeq());
		stat.setInt(2, receipe.getCategory());
		stat.setString(3, receipe.getTitle());
		stat.setString(4, receipe.getContent());
		stat.setString(5, receipe.getRegdate());
		stat.setInt(6, receipe.getReadcount());
		stat.setString(7, receipe.getImgpath());
		
		stat.executeUpdate();
		stat.close();
	}


}
