package hana.ti.stock.vo;

public class StockVO {

	private String id;
	private String code;
	private String name;
	private String category;
	private String reg_date;
	private int price;
	private int flag;
	
	private String k_index;
	private String arrow;
	private String updown;
	private String plusminus;
	private String percent;
	private int yesterdayPrice;
	
	
	
	public int getYesterdayPrice() {
		return yesterdayPrice;
	}
	public void setYesterdayPrice(int yesterdayPrice) {
		this.yesterdayPrice = yesterdayPrice;
	}
	public String getK_index() {
		return k_index;
	}
	public void setK_index(String k_index) {
		this.k_index = k_index;
	}
	public String getArrow() {
		return arrow;
	}
	public void setArrow(String arrow) {
		this.arrow = arrow;
	}
	public String getUpdown() {
		return updown;
	}
	public void setUpdown(String updown) {
		this.updown = updown;
	}
	public String getPlusminus() {
		return plusminus;
	}
	public void setPlusminus(String plusminus) {
		this.plusminus = plusminus;
	}
	public String getPercent() {
		return percent;
	}
	public void setPercent(String percent) {
		this.percent = percent;
	}
	public StockVO() {
		super();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	@Override
	public String toString() {
		return "StockVO [id=" + id + ", code=" + code + ", name=" + name + ", category=" + category + ", reg_date="
				+ reg_date + ", price=" + price + ", flag=" + flag + ", k_index=" + k_index + ", arrow=" + arrow
				+ ", updown=" + updown + ", plusminus=" + plusminus + ", percent=" + percent + "]";
	}
}
