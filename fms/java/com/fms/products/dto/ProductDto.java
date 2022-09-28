package com.fms.products.dto;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class ProductDto {
	private String productsId;				// 상품번호
	private String productsName;		// 상품명
	private String productsBrand;		// 브랜드
	private String productsStatus;		// 입고현황
	private int originalPrice;			// 원가
	private int salePrice;				// 판매가
	private Date publishedDate;			// 출시일
	private int deliveryPrice;			// 배송비
	private String productsSort;		// 상품분류
	private String deliveryMethod;		// 배송방법
	private Date deliveryDate;			// 배송일
	private String brandIntro;			// 브랜드 소개
	private String productsIntro;		// 상품소개
	private String productsSize;		// 상품사이즈
	private int productsPoint;			// 상품포인트
	private String productsImage;		// 상품이미지
	private String productsColor;		// 상품 색상
	//private int pageView;				// 조회수
	//private int reviewCnt;			// 리뷰수
	public String getProductsId() {
		return productsId;
	}
	public void setProductsId(String productsId) {
		this.productsId = productsId;
	}
	public String getProductsName() {
		return productsName;
	}
	public void setProductsName(String productsName) {
		this.productsName = productsName;
	}
	public String getProductsBrand() {
		return productsBrand;
	}
	public void setProductsBrand(String productsBrand) {
		this.productsBrand = productsBrand;
	}
	public String getProductsStatus() {
		return productsStatus;
	}
	public void setProductsStatus(String productsStatus) {
		this.productsStatus = productsStatus;
	}
	public int getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(int originalPrice) {
		this.originalPrice = originalPrice;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public Date getPublishedDate() {
		return publishedDate;
	}
	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public String getProductsSort() {
		return productsSort;
	}
	public void setProductsSort(String productsSort) {
		this.productsSort = productsSort;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getBrandIntro() {
		return brandIntro;
	}
	public void setBrandIntro(String brandIntro) {
		this.brandIntro = brandIntro;
	}
	public String getProductsIntro() {
		return productsIntro;
	}
	public void setProductsIntro(String productsIntro) {
		this.productsIntro = productsIntro;
	}
	public String getProductsSize() {
		return productsSize;
	}
	public void setProductsSize(String productsSize) {
		this.productsSize = productsSize;
	}
	public int getProductsPoint() {
		return productsPoint;
	}
	public void setProductsPoint(int productsPoint) {
		this.productsPoint = productsPoint;
	}
	public String getProductsImage() {
		return productsImage;
	}
	public void setProductsImage(String productsImage) {
		this.productsImage = productsImage;
	}
	public String getProductsColor() {
		return productsColor;
	}
	public void setProductsColor(String productsColor) {
		this.productsColor = productsColor;
	}
	@Override
	public String toString() {
		return "ProductDto [productsId=" + productsId + ", productsName=" + productsName + ", productsBrand="
				+ productsBrand + ", productsStatus=" + productsStatus + ", originalPrice=" + originalPrice
				+ ", salePrice=" + salePrice + ", publishedDate=" + publishedDate + ", deliveryPrice=" + deliveryPrice
				+ ", productsSort=" + productsSort + ", deliveryMethod=" + deliveryMethod + ", deliveryDate="
				+ deliveryDate + ", brandIntro=" + brandIntro + ", productsIntro=" + productsIntro + ", productsSize="
				+ productsSize + ", productsPoint=" + productsPoint + ", productsImage=" + productsImage
				+ ", productsColor=" + productsColor + ", getProductsId()=" + getProductsId() + ", getProductsName()="
				+ getProductsName() + ", getProductsBrand()=" + getProductsBrand() + ", getProductsStatus()="
				+ getProductsStatus() + ", getOriginalPrice()=" + getOriginalPrice() + ", getSalePrice()="
				+ getSalePrice() + ", getPublishedDate()=" + getPublishedDate() + ", getDeliveryPrice()="
				+ getDeliveryPrice() + ", getProductsSort()=" + getProductsSort() + ", getDeliveryMethod()="
				+ getDeliveryMethod() + ", getDeliveryDate()=" + getDeliveryDate() + ", getBrandIntro()="
				+ getBrandIntro() + ", getProductsIntro()=" + getProductsIntro() + ", getProductsSize()="
				+ getProductsSize() + ", getProductsPoint()=" + getProductsPoint() + ", getProductsImage()="
				+ getProductsImage() + ", getProductsColor()=" + getProductsColor() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
