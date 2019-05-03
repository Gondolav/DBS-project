CREATE TABLE Host
(
  hid INT,
  url VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  since DATE NOT NULL,
  about VARCHAR(1000) NOT NULL,
  response_time VARCHAR(30),
  response_rate FLOAT,
  thumbnail_url VARCHAR(100) NOT NULL,
  picture_url VARCHAR(100) NOT NULL,
  nid INT NOT NULL,
  PRIMARY KEY (hid),
  FOREIGN KEY(nid) REFERENCES Neighbourhood(nid)
);

CREATE TABLE Verifications
(
  vid INT,
  verifications VARCHAR(100) NOT NULL,
  PRIMARY KEY (vid)
);

CREATE TABLE Neighbourhood
(
  nid INT,
  neighbourhood VARCHAR(200) NOT NULL,
  PRIMARY KEY (nid)
);

CREATE TABLE Has_verif
(
    vid INT,
    hid INT,
    PRIMARY KEY (vid, hid),
    FOREIGN KEY (vid) REFERENCES Verifications(vid),
    FOREIGN KEY (hid) REFERENCES Host(hid)
);

CREATE TABLE Reviews
(
    lid INT NOT NULL,
    id INT,
    rdate DATE NOT NULL,
    rid INT NOT NULL,
    comments TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (lid) REFERENCES Listing(lid),
    FOREIGN KEY (rid) REFERENCES Reviewer(rid)
);

CREATE TABLE Reviewer
(
  rid INT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (rid)
);

CREATE TABLE Calendar
(
  lid INT,
  cdate DATE,
  available CHAR(1) NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (cdate, lid),
  FOREIGN KEY (lid) REFERENCES Listing ON DELETE CASCADE
);

CREATE TABLE Country
(
  coid INT,
  country VARCHAR(100) NOT NULL,
  country_code VARCHAR(2) NOT NULL,
  PRIMARY KEY (coid)
);

CREATE TABLE City
(
  ciid INT,
  city VARCHAR(100) NOT NULL,
  PRIMARY KEY (ciid)
);

CREATE TABLE Amenities
(
  aid INT,
  amenities VARCHAR(200) NOT NULL,
  PRIMARY KEY (aid)
);

CREATE TABLE Has_amen
(
    aid INT,
    lid INT,
    PRIMARY KEY (aid, lid),
    FOREIGN KEY (aid) REFERENCES Amenities(aid),
    FOREIGN KEY (lid) REFERENCES Listing(lid)
);

CREATE TABLE Listing
(
  lid INT,
  url VARCHAR(100) NOT NULL,
  name VARCHAR(300) NOT NULL,
  summary TEXT,
  space TEXT,
  description TEXT,
  neighbourhood_overview TEXT,
  notes TEXT,
  transit TEXT,
  laccess TEXT,
  interaction TEXT,
  house_rules TEXT,
  picture_url VARCHAR(100) NOT NULL,
  nid INT NOT NULL,
  ciid INT NOT NULL,
  coid INT NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  property_type_id INT NOT NULL,
  room_type_id INT NOT NULL,
  accommodates INT NOT NULL,
  bathrooms FLOAT,
  bedrooms INT,
  beds INT,
  bed_type_id INT NOT NULL,
  square_feet INT,
  price FLOAT NOT NULL,
  weekly_price FLOAT,
  monthly_price FLOAT,
  security_deposit FLOAT,
  cleaning_fee FLOAT,
  guests_included INT NOT NULL,
  extra_people FLOAT NOT NULL,
  minimum_nights INT NOT NULL,
  maximum_nights INT NOT NULL,
  review_scores_rating INT,
  review_scores_accuracy INT,
  review_scores_cleanliness INT,
  review_scores_checkin INT,
  review_scores_communication INT,
  review_scores_location INT,
  review_scores_value INT,
  is_business_travel_ready CHAR(1) NOT NULL,
  cancellation_policy_id INT NOT NULL,
  require_guest_profile_picture CHAR(1) NOT NULL,
  require_guest_phone_verification CHAR(1) NOT NULL,
  hid INT NOT NULL,
  PRIMARY KEY (lid),
  FOREIGN KEY (hid) REFERENCES Host ON DELETE CASCADE,
  FOREIGN KEY (nid) REFERENCES Neighbourhood(nid),
  FOREIGN KEY (ciid) REFERENCES City(ciid),
  FOREIGN KEY (coid) REFERENCES Country(coid),
  FOREIGN KEY (property_type_id) REFERENCES Property_type(ptid),
  FOREIGN KEY (room_type_id) REFERENCES Room_type(rtid),
  FOREIGN KEY (bed_type_id) REFERENCES Bed_type(btid),
  FOREIGN KEY (cancellation_policy_id) REFERENCES Cancellation_policy(cpid)
);


CREATE TABLE Property_type
(
    ptid INT,
    property_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (ptid)
);

CREATE TABLE Room_type
(
    rtid INT,
    room_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (rtid)
);

CREATE TABLE Bed_type
(
    btid INT,
    bed_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (btid)
);

CREATE TABLE Cancellation_policy
(
    cpid INT,
    cancellation_policy VARCHAR(50) NOT NULL,
    PRIMARY KEY (cpid)
);
