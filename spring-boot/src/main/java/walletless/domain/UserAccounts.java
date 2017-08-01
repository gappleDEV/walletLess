package walletless.domain;

import java.util.Date;
import javax.persistence.*;

@Entity
public class UserAccounts {

    /*@Id@GeneratedValue(strategy=GenerationType.AUTO)
    private long id;*/
    @Id
    private String username;
    
    private String password;
    private Integer acctType;
    private Date createDate;
    private Integer isActive;

    public UserAccounts() {}
    
    public UserAccounts(String username, String password, Integer acctType, Date createDate, Integer isActive) {
    		this.username = username;
    		this.password = password;
    		this.acctType = acctType;
    		this.createDate = createDate;
    		this.isActive = isActive;
    }

    public String getUsername(){
        return username;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public int getAcctType(){
        return acctType;
    }

    public void setAcctType(int acctType){
        this.acctType = acctType;
    }

    public Date getCreateDate(){
        return createDate;
    }
    
    public void setCreateDate(Date createDate){
        this.createDate = createDate;
    }

    public int getIsActive(){
        return isActive;
    }

    public void setIsActive(int isActive){
        this.isActive = isActive;
    }
}