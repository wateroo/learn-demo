package com.watero.service;

import com.github.pagehelper.PageInfo;
import com.watero.entity.Role;

import java.util.List;

public interface RoleService {
    public Role queryById(Long id);

    public PageInfo<Role> getPageInfo(Role role, int pageNum, int pageSize);

    public boolean deleteRole(List<Long> idList);

    public int insertOrUpdateRole(Role role);

    public int deleteRoleBatch(List<Long> idList);

}
