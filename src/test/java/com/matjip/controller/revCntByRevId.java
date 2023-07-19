package com.matjip.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class revCntByRevId {

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	int cnt = 0;

	@Test
	public void testGetResCnt() {
		String sql = "select count(*) as rsCnt from restaurant";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("rsCnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try { pstmt.close(); } catch (SQLException e) {}
			}
			if (con != null) {
				try {con.close();} catch (SQLException e) {}
			}
		}
	}
	
	@Test
	public void testRevCntByRes() {
		String sql = "select count(rev_idx) as revCnt from review where rs_idx=?";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			for(int i=1; i<=cnt;i++) {
				pstmt.setInt(1, i);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					System.out.println(rs.getInt("revCnt"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try { pstmt.close(); } catch (SQLException e) {}
			}
			if (con != null) {
				try {con.close();} catch (SQLException e) {}
			}
		}
	}
}
