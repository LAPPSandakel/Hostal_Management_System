package net.javaguides.springboot.Entity;

import javax.persistence.*;

@Entity
@Table(name = "awcomplaint")
public class Awcomplaint {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name = "id")
    private Long id;

    @Column(name = "RoomId")
    private String roomId;

    @Column(name = "ItemName")
    private String itemName;

    @Column(name = "ItemId")
    private String itemId;
    @Column(name = "Image")
    private String image;
    @Column(name = "Description")
    private String description;

    @Column(name = "StudentId")
    private String studentId;

    public Awcomplaint() {

    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Awcomplaint(String roomId,String itemId,String studentId, String itemName, String image, String description) {
        super();
        this.roomId=roomId;
        this.itemId=itemId;
        this.studentId=studentId;
        this.itemName=itemName;
        this.image=image;
        this.description=description;
    }
}
