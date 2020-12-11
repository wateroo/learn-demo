package com.watero.mapper;

import com.watero.entity.UserRoleInfo;
import com.watero.entity.UserRoleInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserRoleInfoMapper {
    long countByExample(UserRoleInfoExample example);

    int deleteByExample(UserRoleInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UserRoleInfo record);

    int insertSelective(UserRoleInfo record);

    List<UserRoleInfo> selectByExample(UserRoleInfoExample example);

    UserRoleInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UserRoleInfo record, @Param("example") UserRoleInfoExample example);

    int updateByExample(@Param("record") UserRoleInfo record, @Param("example") UserRoleInfoExample example);

    int updateByPrimaryKeySelective(UserRoleInfo record);

    int updateByPrimaryKey(UserRoleInfo record);
}