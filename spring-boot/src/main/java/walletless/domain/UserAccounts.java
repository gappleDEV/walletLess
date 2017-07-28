package walletless;

import javax.persistance.Entity;
import javax.persistance.GeneratedValue;
import javax.persistance.GeneratedType;
improt javax.persistance.Id;

@Entity
public class UserAccounts {

    @Id@GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    
    private String username;
    private String password;
    private int acctType;
    private Date createDate;
    private int isActive;

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id
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