package com.test.crawler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Random;

import com.test.user.main.DBUtil;

public class ReviewDummy {
	//
	public static void main(String[] args) {
		
		Random rnd = new Random();
		String[] titles = {"신선","신선하니 좋네요","맛 괜춘","양이 적어요","양많고 싱싱해요","맛있어요","그냥 그래요"};
		String[] contents  = {"신선하니 맛있고 좋아요","맛이 나쁘지 않네요 잘 먹었습니다","Good choice!","재구매 의사있음","재구매 의사따윈 없음 개떡같음","개별로임","사지마셈","맛있게 잘먹었습니다. 덕분에 좋은 저녁 ㄳㄳㄳ","번창하세요 온누리 세계를 뒤넘어 우주까지 추천추천"};
		
		HashSet<Integer> orderdetailSeqList = new HashSet<Integer>();
		while(orderdetailSeqList.size()<500) {
			orderdetailSeqList.add(rnd.nextInt(20000)+1);
		}
		Connection conn = new DBUtil().open();
		for (int seq : orderdetailSeqList) {
			
			try {
				
				String imgQuery = String.format("(select img from product where seq = (select productseq from orderdetail where seq = %d))",seq);
				String regDateQuery = String.format("(select regdate+3 from orderList where seq = (select orderseq from orderdetail where seq = %d))", seq);
				
				PreparedStatement stat = null;
				
				String sql = String.format("insert into review values (seqreview.nextVal,?,?,?,%s,%s,?,default)",imgQuery,regDateQuery);
				
				stat = conn.prepareStatement(sql);
				stat.setInt(1, seq);
				stat.setString(2,titles[rnd.nextInt(titles.length)]);
				stat.setString(3,contents[rnd.nextInt(contents.length)]);
				stat.setInt(4,rnd.nextInt(100)+1);
				
				stat.executeUpdate();
				stat.close();
				System.out.println(">>>>>> insert complete");
				
			} catch (Exception e) {
				e.printStackTrace();
				break;
				
			}
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static Review createReview() {
		
		Review review = new Review();
		
		
		
		
		
		return review;
		
		
		
	}
}
