package cn.com.guimei.pojo;

public class ExtGoods extends Goods{
    private SmallClass smallClass;
    private Discount discount;
    private Seller seller;

    public Discount getDiscount() {
        return discount;
    }

    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    public SmallClass getSmallClass() {
        return smallClass;
    }

    public void setSmallClass(SmallClass smallClass) {
        this.smallClass = smallClass;
    }

    public Seller getSeller() {
        return seller;
    }

    public void setSeller(Seller seller) {
        this.seller = seller;
    }
}
