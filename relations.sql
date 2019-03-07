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
  neighbourhood VARCHAR(300) NOT NULL,
  verifications VARCHAR(300) NOT NULL,
  PRIMARY KEY (hid)
);

CREATE TABLE Reviews
(
    id INT,
    lid INT NOT NULL,
    rid INT NOT NULL,
    date DATE NOT NULL,
    comments VARCHAR(500) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (lid) REFERENCES Listing,
    FOREIGN KEY (rid) REFERENCES Reviewer
);

CREATE TABLE Reviewer
(
  rid INT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (rid)
);

CREATE TABLE Calendar
(
  date DATE,
  lid INT,
  available BIT NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (date, lid),
  FOREIGN KEY (lid) REFERENCES Listing ON DELETE CASCADE
);

CREATE TABLE Listing
(
  lid INT,
  url VARCHAR(100) NOT NULL,
  name VARCHAR(300) NOT NULL,
  summary VARCHAR(1000) NOT NULL,
  space VARCHAR(1000) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  neighbourhood_overview VARCHAR(1000) NOT NULL,
  notes VARCHAR(1000) NOT NULL,
  transit VARCHAR(1000) NOT NULL,
  access VARCHAR(1000) NOT NULL,
  interaction VARCHAR(1000) NOT NULL,
  house_rules VARCHAR(1000) NOT NULL,
  picture_url VARCHAR(100) NOT NULL,
  neighbourhood VARCHAR(300) NOT NULL,
  city VARCHAR(100) NOT NULL,
  country_code CHAR(2) NOT NULL,
  country VARCHAR(30) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  property_type VARCHAR(50) NOT NULL,
  room_type VARCHAR(50) NOT NULL,
  accommodates INT NOT NULL,
  bathrooms FLOAT NOT NULL,
  bedrooms INT NOT NULL,
  beds INT NOT NULL,
  bed_type VARCHAR(50) NOT NULL,
  amenities VARCHAR(1000) NOT NULL,
  square_feet INT,
  price FLOAT NOT NULL,
  weekly_price FLOAT,
  monthly_price FLOAT,
  security_deposit FLOAT NOT NULL,
  cleaning_fee FLOAT,
  guests_included INT NOT NULL,
  extra_people FLOAT NOT NULL,
  minimum_nights INT NOT NULL,
  maximum_nights INT NOT NULL,
  is_business_travel_ready BIT NOT NULL,
  cancellation_policy VARCHAR(50) NOT NULL,
  require_guest_profile_picture BIT NOT NULL,
  require_guest_phone_verification BIT NOT NULL,
  review_scores_rating INT,
  review_scores_accuracy INT,
  review_scores_cleanliness INT,
  review_scores_checkin INT,
  review_scores_communication INT,
  review_scores_location INT,
  review_scores_value INT,
  hid INT NOT NULL,
  PRIMARY KEY (lid),
  FOREIGN KEY (hid) REFERENCES Host ON DELETE CASCADE
);
