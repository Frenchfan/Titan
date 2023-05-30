package com.titan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity(name="Internee")
public class Internee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String mobile;

    private String email;

    private String snils;

    private String name;

    private String surname;

    private String patronymic;

    private LocalDate birthday;

    private String nickName;

    private int citizenship;

    private int city;

    private int yearStudy;

    private boolean hasWorkExperience;

    private int moscowDistrict;

    private boolean trainee;

    private String photo;

    private boolean notifyByMail;

    private int rating;

    private String cv;

    private int eduProgram;

    private int internshipId;

    private int internshipStatus;

    public Internee() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSnils() {
        return snils;
    }

    public void setSnils(String snils) {
        this.snils = snils;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(int citizenship) {
        this.citizenship = citizenship;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }

    public int getYearStudy() {
        return yearStudy;
    }

    public void setYearStudy(int yearStudy) {
        this.yearStudy = yearStudy;
    }

    public boolean isHasWorkExperience() {
        return hasWorkExperience;
    }

    public void setHasWorkExperience(boolean hasWorkExperience) {
        this.hasWorkExperience = hasWorkExperience;
    }

    public int getMoscowDistrict() {
        return moscowDistrict;
    }

    public void setMoscowDistrict(int moscowDistrict) {
        this.moscowDistrict = moscowDistrict;
    }

    public boolean isTrainee() {
        return trainee;
    }

    public void setTrainee(boolean trainee) {
        this.trainee = trainee;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public boolean isNotifyByMail() {
        return notifyByMail;
    }

    public void setNotifyByMail(boolean notifyByMail) {
        this.notifyByMail = notifyByMail;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getCv() {
        return cv;
    }

    public void setCv(String cv) {
        this.cv = cv;
    }

    public int getEduProgram() {
        return eduProgram;
    }

    public void setEduProgram(int eduProgram) {
        this.eduProgram = eduProgram;
    }

    public int getInternshipId() {
        return internshipId;
    }

    public void setInternshipId(int internshipId) {
        this.internshipId = internshipId;
    }

    public int getInternshipStatus() {
        return internshipStatus;
    }

    public void setInternshipStatus(int internshipStatus) {
        this.internshipStatus = internshipStatus;
    }
}

