package com.walletless.api.models;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "pureform_files")
public class PureformImageFile {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;

    private String fileName;

    private String fileType;

    @Lob
    private byte[] data;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public PureformImageFile() {}

    public PureformImageFile(String fileName, String fileType, byte[] data, User user) {
        this.fileName = fileName;
        this.fileType = fileType;
        this.data = data;
        this.user = user;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }
    public String getFileType() { return fileType; }
    public void setFileType(String fileType) { this.fileType = fileType; }
    public byte[] getData() { return data; }
    public void setData(byte[] data) { this.data = data; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}
