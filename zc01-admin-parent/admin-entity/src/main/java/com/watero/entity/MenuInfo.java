package com.watero.entity;

import java.util.ArrayList;
import java.util.List;

public class MenuInfo {
    private Long id;

    private Long pid;

    private String name;

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    private String url;

    private String icon;

    private Boolean open = true;

    private List<MenuInfo> childList = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public List<MenuInfo> getChildList() {
        return childList;
    }

    public void setChildList(List<MenuInfo> childList) {
        this.childList = childList;
    }
}