package com.ssm.pojo;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;

@TableName("t_book")
public class Book implements Serializable {
    @Autowired
    private RedisTemplate redisTemplate;
    /**
     * 图书ID
     */
    @TableId(value="book_id",type= IdType.AUTO)
    private Integer bookId;

    /**
     * 书名 */
    private String bookName;

    /**
     * 价格
     */
    private BigDecimal bookPrice;

    /**
     * 划线价
     */
    private BigDecimal delPrice;

    /**
     * 作者
     */
    private String bookAuthor;

    /**
     * 出版社
     */
    private String bookPress;

    /**
     * 出版日期
     */
    private String pressDate;

    /**
     * 销量
     */
    private Integer bookSales;

    /**
     * 库存
     */
    private Integer bookStock;

    /**
     * 图书封面
     */
    private String imgPath;

    /**
     * 图书类型
     */
    private String bookType;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public BigDecimal getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(BigDecimal bookPrice) {
        this.bookPrice = bookPrice;
    }

    public BigDecimal getDelPrice() {
        return delPrice;
    }

    public void setDelPrice(BigDecimal delPrice) {
        this.delPrice = delPrice;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress;
    }

    public String getPressDate() {
        return pressDate;
    }

    public void setPressDate(String pressDate) {
        this.pressDate = pressDate;
    }

    public Integer getBookSales() {
        return bookSales;
    }

    public void setBookSales(Integer bookSales) {
        this.bookSales = bookSales;
    }

    public Integer getBookStock() {
        return bookStock;
    }

    public void setBookStock(Integer bookStock) {
        this.bookStock = bookStock;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getBookType() {
        return bookType;
    }

    public void setBookType(String bookType) {
        this.bookType = bookType;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookPrice=" + bookPrice +
                ", delPrice=" + delPrice +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPress='" + bookPress + '\'' +
                ", pressDate='" + pressDate + '\'' +
                ", bookSales=" + bookSales +
                ", bookStock=" + bookStock +
                ", imgPath='" + imgPath + '\'' +
                ", bookType='" + bookType + '\'' +
                '}';
    }
}
