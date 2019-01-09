package cn.com.guimei.pojo;

import java.util.List;

public class Page<T> {
    private int pageSize;
    private int pageNumber;
    private int totalPage;
    private int totalRecode;
    private List<T> pageData;
    private String pageUrl;
    public Page() {
    }

    public Page(int pageSize, int pageNumber, int totalRecode, List<T> pageData) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        this.totalRecode = totalRecode;
        this.pageData = pageData;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    /**
     * 计算总页码数
     * @return totalPage
     */

    public int getTotalPage(){
        return totalRecode%pageSize==0? totalRecode/pageSize : totalRecode/pageSize+1;
    }
    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getTotalRecode() {
        return totalRecode;
    }

    public void setTotalRecode(int totalRecode) {
        this.totalRecode = totalRecode;
    }

    public List<T> getPageData() {
        return pageData;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageSize=" + pageSize +
                ", pageNumber=" + pageNumber +
                ", totalRecode=" + totalRecode +
                ", pageData=" + pageData +
                ", totalPage=" + totalPage +
                '}';
    }
}
