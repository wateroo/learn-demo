package com.watero.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.watero.entity.Role;
import com.watero.exception.RoleOptionException;
import com.watero.mapper.RoleMapper;
import com.watero.service.RoleService;
import com.watero.util.CommonConfigConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleMapper roleMapper;

    @Override
    public Role queryById(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Role> getPageInfo(Role role, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Role> roleList = roleMapper.queryRoleListPageInfo(role);
        PageInfo<Role> pageInfo = new PageInfo<>(roleList);
        return pageInfo;
    }

    @Override
    public boolean deleteRole(List<Long> idList) {
        int sum = idList.size();
        if (idList.size() > 0) {
            int i = 0;
            for (Long id : idList) {
                if(id==null){
                    continue;
                }
                int rs = roleMapper.deleteByPrimaryKey(id);
                if (rs != 0) i++;
            }
            if (i == sum) {
                return true;
            }
        }
        return false;
    }


    @Override
    public int insertOrUpdateRole(Role role) {
        if(role.getRoleId()!=null){
           return roleMapper.updateByPrimaryKey(role);
        }
        return roleMapper.insert(role);
    }

    @Override
    public int deleteRoleBatch(List<Long> idList) {
        int sum = roleMapper.deleteRoleBatch(idList);
        if(idList.size()!=sum){
            throw new RoleOptionException(CommonConfigConstant.MESSAGE_ROLE_DELETE_FAIL);
        }
        return sum;
    }
}