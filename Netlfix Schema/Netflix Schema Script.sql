Create Database Netflix;
use netflix;

-- Schema Making

-- 1. Basic Entity : Users
CREATE TABLE users(
	userID INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
	passowrd VARCHAR(255) NOT NULL,
    primary key(userID)
);

-- -- Look Up Table : for types of profile.
Create table viewer_type(
	typeID INT NOT NULL auto_increment,
    type varchar(255) NOT NULL,
    primary key(typeID)
);

-- 2. Basic Entity : Profiles
CREATE TABLE profiles(
	profileID INT NOT NULL AUTO_INCREMENT,
    name INT NOT NULL UNIQUE,
	typeID INT NOT NULL,
    userID INT NOT NULL,
    primary key(profileID),
    foreign key (typeID) REFERENCES viewer_type(typeID),
    foreign Key (userID) REFERENCES users(userID)
);


-- 3. Basic Entity : Videos
CREATE TABLE Videos(
	videoID INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL,
    primary key(videoID)
);

-- 4. Basic Entity : Casts
CREATE TABLE Casts(
	castID INT NOT NULL AUTO_INCREMENT,
    actors VARCHAR(255) NOT NULL,
    primary key(castID)
);

-- -- Mapping Table : Video_casts
CREATE TABLE video_casts(
    videoID INT NOT NULL,
	castID INT NOT NULL,
    primary key(videoID, castID),
    foreign key (videoID) REFERENCES Videos(videoID),
    foreign Key (castID) REFERENCES Casts(castID)
);

-- -- Lookup Table : For status in Profile_videos
CREATE TABLE status_type(
	statusID INT NOT NULL auto_increment,
    status VARCHAR(255) NOT NULL,
    primary key(statusID)
);

-- -- Mapping Table : profile_videos
CREATE TABLE profile_videos(
	profileId INT NOT NULL,
    videoID INT NOT NULL,
    statusID INT NOT NULL,
    Timestamp datetime NOT NULL,
    primary key(profileID, videoID),
    foreign key(profileID) references profiles(profileID),
    foreign key(videoID) references videos(videoID),
	foreign key(statusID) references status_type(statusID)
);
