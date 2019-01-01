package com.anhong.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.anhong.project.vo.TestVO;

@Repository
public class TestDAO {
	      
	      @Autowired
	      private SqlSession SqlSession;
	      
	      public List<TestVO> getTestValue(TestVO testVO){
	            return SqlSession.selectList("com.hee.heechart.getTestValue", testVO);
	      }
}
