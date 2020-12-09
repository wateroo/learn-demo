package com.watero.controller;

import com.watero.entity.ParamData;
import com.watero.entity.UserVO;
import com.watero.util.ResultEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class HelloController {

    Logger logger = LoggerFactory.getLogger(HelloController.class);

    @RequestMapping("/array1")
    public ResultEntity<Object> array1(@RequestParam(value = "array[]") String[] array) {
        logger.debug("接收数组"+array);

        ResultEntity<Object> resultEntity = ResultEntity.successWithoutData();
        resultEntity.setData(array);
        return resultEntity;
    }

    @RequestMapping("/array2")
    public ResultEntity<Object> array2(ParamData paramData) {
        logger.debug("接收数组：{}",paramData);

        ResultEntity<Object> resultEntity = ResultEntity.successWithoutData();
        resultEntity.setData(paramData);
        return resultEntity;
    }


    @RequestMapping("/array3")
    public ResultEntity<Object> array3(@RequestBody List<Integer> array) {
        logger.debug("接收数组：{}",array);
        ResultEntity<Object> resultEntity = ResultEntity.successWithoutData();
        resultEntity.setData(array);
        return resultEntity;
    }

    @RequestMapping("/array4")
    public ResultEntity<Object> array4(@RequestBody UserVO userVO,@RequestParam(value = "userName") String userName) {
        logger.debug("接收参数：{}",userVO);
        ResultEntity<Object> resultEntity = ResultEntity.successWithoutData();
        resultEntity.setData(userVO);
        return resultEntity;
    }
}
