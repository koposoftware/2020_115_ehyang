package hana.ti.account.vo;

public class AccountVO {

	private String account_num;      
    private String id;
    private String password;
    private String name;
    private String alias;
    private int balance;
    private String register;
    private String bank;
    private int money;
    private String fAccount_num;
    private String tAccount_num;
    
	public String getfAccount_num() {
		return fAccount_num;
	}
	public void setfAccount_num(String fAccount_num) {
		this.fAccount_num = fAccount_num;
	}
	public String gettAccount_num() {
		return tAccount_num;
	}
	public void settAccount_num(String tAccount_num) {
		this.tAccount_num = tAccount_num;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getAccount_num() {
		return account_num;
	}
	public void setAccount_num(String account_num) {
		this.account_num = account_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}

}
