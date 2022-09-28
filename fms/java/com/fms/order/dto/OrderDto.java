package com.fms.order.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderDto {
	private int orderId;
	private String memberId;
	private String productsId;
	private int originalPirce;
	private int salePrice;
	private String ordererName;
	private String ordererHp;
	private int orderProductsQty;
	private String receiverName;
	private String receiverHp1;
	private String receiverHp2;
	private String receiverHp3;
	private String deliveryAddress;
	private String deliveryMethod;
	private String payMethod;
	private String payOrdererHpNum;
	private Date payOrderTime;
	private String cardComName;
	private String cardPayMonth;
	private String deliveryState;
	private String productsName;
	private String deliveryMessage;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductsId() {
		return productsId;
	}
	public void setProductsId(String productsId) {
		this.productsId = productsId;
	}
	public int getOriginalPirce() {
		return originalPirce;
	}
	public void setOriginalPirce(int originalPirce) {
		this.originalPirce = originalPirce;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public String getOrdererName() {
		return ordererName;
	}
	public void setOrdererName(String ordererName) {
		this.ordererName = ordererName;
	}
	public String getOrdererHp() {
		return ordererHp;
	}
	public void setOrdererHp(String ordererHp) {
		this.ordererHp = ordererHp;
	}
	public int getOrderProductsQty() {
		return orderProductsQty;
	}
	public void setOrderProductsQty(int orderProductsQty) {
		this.orderProductsQty = orderProductsQty;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverHp1() {
		return receiverHp1;
	}
	public void setReceiverHp1(String receiverHp1) {
		this.receiverHp1 = receiverHp1;
	}
	public String getReceiverHp2() {
		return receiverHp2;
	}
	public void setReceiverHp2(String receiverHp2) {
		this.receiverHp2 = receiverHp2;
	}
	public String getReceiverHp3() {
		return receiverHp3;
	}
	public void setReceiverHp3(String receiverHp3) {
		this.receiverHp3 = receiverHp3;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getDeliveryMethod() {
		return deliveryMethod;
	}
	public void setDeliveryMethod(String deliveryMethod) {
		this.deliveryMethod = deliveryMethod;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayOrdererHpNum() {
		return payOrdererHpNum;
	}
	public void setPayOrdererHpNum(String payOrdererHpNum) {
		this.payOrdererHpNum = payOrdererHpNum;
	}
	public Date getPayOrderTime() {
		return payOrderTime;
	}
	public void setPayOrderTime(Date payOrderTime) {
		this.payOrderTime = payOrderTime;
	}
	public String getCardComName() {
		return cardComName;
	}
	public void setCardComName(String cardComName) {
		this.cardComName = cardComName;
	}
	public String getCardPayMonth() {
		return cardPayMonth;
	}
	public void setCardPayMonth(String cardPayMonth) {
		this.cardPayMonth = cardPayMonth;
	}
	public String getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(String deliveryState) {
		this.deliveryState = deliveryState;
	}
	public String getProductsName() {
		return productsName;
	}
	public void setProductsName(String productsName) {
		this.productsName = productsName;
	}
	public String getDeliveryMessage() {
		return deliveryMessage;
	}
	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}
	@Override
	public String toString() {
		return "OrderDto [orderId=" + orderId + ", memberId=" + memberId + ", productsId=" + productsId
				+ ", originalPirce=" + originalPirce + ", salePrice=" + salePrice + ", ordererName=" + ordererName
				+ ", ordererHp=" + ordererHp + ", orderProductsQty=" + orderProductsQty + ", receiverName="
				+ receiverName + ", receiverHp1=" + receiverHp1 + ", receiverHp2=" + receiverHp2 + ", receiverHp3="
				+ receiverHp3 + ", deliveryAddress=" + deliveryAddress + ", deliveryMethod=" + deliveryMethod
				+ ", payMethod=" + payMethod + ", payOrdererHpNum=" + payOrdererHpNum + ", payOrderTime=" + payOrderTime
				+ ", cardComName=" + cardComName + ", cardPayMonth=" + cardPayMonth + ", deliveryState=" + deliveryState
				+ ", productsName=" + productsName + ", deliveryMessage=" + deliveryMessage + ", getOrderId()="
				+ getOrderId() + ", getMemberId()=" + getMemberId() + ", getProductsId()=" + getProductsId()
				+ ", getOriginalPirce()=" + getOriginalPirce() + ", getSalePrice()=" + getSalePrice()
				+ ", getOrdererName()=" + getOrdererName() + ", getOrdererHp()=" + getOrdererHp()
				+ ", getOrderProductsQty()=" + getOrderProductsQty() + ", getReceiverName()=" + getReceiverName()
				+ ", getReceiverHp1()=" + getReceiverHp1() + ", getReceiverHp2()=" + getReceiverHp2()
				+ ", getReceiverHp3()=" + getReceiverHp3() + ", getDeliveryAddress()=" + getDeliveryAddress()
				+ ", getDeliveryMethod()=" + getDeliveryMethod() + ", getPayMethod()=" + getPayMethod()
				+ ", getPayOrdererHpNum()=" + getPayOrdererHpNum() + ", getPayOrderTime()=" + getPayOrderTime()
				+ ", getCardComName()=" + getCardComName() + ", getCardPayMonth()=" + getCardPayMonth()
				+ ", getDeliveryState()=" + getDeliveryState() + ", getProductsName()=" + getProductsName()
				+ ", getDeliveryMessage()=" + getDeliveryMessage() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}

