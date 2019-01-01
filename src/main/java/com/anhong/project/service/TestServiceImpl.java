package com.anhong.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anhong.project.dao.TestDAO;
import com.anhong.project.vo.TestVO;

@Service

public class TestServiceImpl implements TestService{

	  @Autowired
      TestDAO TestDAO;
      
      @Override
      public List<TestVO> getTestValue(TestVO testVO){
            return TestDAO.getTestValue(testVO);
      }


}
