CREATE TABLE Users(
   id_users INT,
   email VARCHAR(50),
   DOB DATE,
   password VARCHAR(50),
   date_create DATE,
   date_end DATE,
   username VARCHAR(50),
   PRIMARY KEY(id_users)
);

CREATE TABLE channels(
   id_channels INT,
   channelName VARCHAR(50),
   id_users INT NOT NULL,
   PRIMARY KEY(id_channels),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE streams(
   id_stream INT,
   title VARCHAR(50),
   startTime VARCHAR(50),
   id_users INT NOT NULL,
   PRIMARY KEY(id_stream),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE userSettings(
   id_userSettings INT,
   settingName VARCHAR(50),
   settingValue VARCHAR(50),
   id_users INT NOT NULL,
   PRIMARY KEY(id_userSettings),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE usersProfile(
   id_usersProfile INT,
   bio VARCHAR(150),
   profilePictureUrl VARCHAR(50),
   id_users INT NOT NULL,
   PRIMARY KEY(id_usersProfile),
   UNIQUE(id_users),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);


CREATE TABLE Subs(
   id_subs INT,
   sub_type VARCHAR(50),
   price DECIMAL(15,2),
   duration VARCHAR(50),
   id_users INT NOT NULL,
   id_channels INT NOT NULL,
   PRIMARY KEY(id_subs),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels)
);

CREATE TABLE categories(
   id_categories INT,
   name VARCHAR(50),
   description VARCHAR(50),
   id_stream INT NOT NULL,
   PRIMARY KEY(id_categories),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream)
);

CREATE TABLE streamMetadata(
   id_streamMetadata INT,
   resolution VARCHAR(50),
   bitrate VARCHAR(50),
   id_stream INT NOT NULL,
   PRIMARY KEY(id_streamMetadata),
   UNIQUE(id_stream),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream)
);

CREATE TABLE streamtags(
   id_streamtag INT,
   id_stream INT NOT NULL,
   PRIMARY KEY(id_streamtag),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream)
);

CREATE TABLE videos(
   id_videos INT,
   title VARCHAR(50),
   duration VARCHAR(50),
   id_users INT NOT NULL,
   id_stream INT NOT NULL,
   PRIMARY KEY(id_videos),
   UNIQUE(id_stream),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream)
);

CREATE TABLE videoMetadata(
   id_videoMetadata INT,
   resolution VARCHAR(50),
   bitrate VARCHAR(50),
   id_videos INT NOT NULL,
   PRIMARY KEY(id_videoMetadata),
   UNIQUE(id_videos),
   FOREIGN KEY(id_videos) REFERENCES videos(id_videos)
);

CREATE TABLE channelSettings(
   id_channelSettings INT,
   settingName VARCHAR(50),
   settingValue VARCHAR(50),
   id_channels INT NOT NULL,
   PRIMARY KEY(id_channelSettings),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels)
);

CREATE TABLE followers(
   id_followers INT,
   id_users INT NOT NULL,
   id_channels INT NOT NULL,
   PRIMARY KEY(id_followers),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels)
);

CREATE TABLE chatMessages(
   id_chatMessages INT,
   messageContent VARCHAR(50),
   timeStamps TIME,
   id_stream INT NOT NULL,
   PRIMARY KEY(id_chatMessages),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream)
);

CREATE TABLE chatModerators(
   id_chatModerators INT,
   PRIMARY KEY(id_chatModerators)
);

CREATE TABLE chatBans(
   id_chatBans INT,
   reason VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_chatBans)
);

CREATE TABLE donations(
   id_donation VARCHAR(50),
   amount DECIMAL(15,2),
   timeStamps TIME,
   id_channels INT NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_donation),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);


CREATE TABLE bitsTransactions(
   id_bitsTransaction INT,
   amount DECIMAL(15,2),
   timeStamps VARCHAR(50),
   PRIMARY KEY(id_bitsTransaction)
);

CREATE TABLE Ads(
   id_ads INT,
   Adcontent VARCHAR(50),
   timeStamps TIME,
   id_stream INT NOT NULL,
   id_users INT,
   PRIMARY KEY(id_ads),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE adMetrics(
   id_adMetric INT,
   views VARCHAR(50),
   clicks VARCHAR(50),
   PRIMARY KEY(id_adMetric)
);

CREATE TABLE events(
   id_events INT,
   eventName VARCHAR(50),
   eventDate DATE,
   PRIMARY KEY(id_events)
);

CREATE TABLE eventParticipants(
   id_eventParticipants INT,
   id_events INT,
   PRIMARY KEY(id_eventParticipants),
   FOREIGN KEY(id_events) REFERENCES events(id_events)
);

CREATE TABLE clips(
   id_clips INT,
   title VARCHAR(50),
   views VARCHAR(50),
   id_stream INT NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_clips),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE clipMetadata(
   id_clipMetadata INT,
   duration VARCHAR(50),
   id_clips INT NOT NULL,
   PRIMARY KEY(id_clipMetadata),
   UNIQUE(id_clips),
   FOREIGN KEY(id_clips) REFERENCES clips(id_clips)
);

CREATE TABLE achievements(
   id_achievements INT,
   achievementName VARCHAR(50),
   dateAchieved DATE,
   PRIMARY KEY(id_achievements)
);

CREATE TABLE reports(
   id_reports INT,
   reason VARCHAR(50),
   timeStamps DATETIME,
   id_users INT NOT NULL,
   PRIMARY KEY(id_reports),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE appeals(
   id_appeals INT,
   appealContent VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_appeals)
);

CREATE TABLE notifications(
   id_notifications INT,
   notificationContent VARCHAR(50),
   timeStamps DATETIME,
   id_users INT NOT NULL,
   PRIMARY KEY(id_notifications),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE friendships(
   id_friendships INT,
   status VARCHAR(50),
   PRIMARY KEY(id_friendships)
);

CREATE TABLE roles(
   id_roles INT,
   roleName VARCHAR(50),
   PRIMARY KEY(id_roles)
);

CREATE TABLE roleAssignments(
   id_roleAssignments INT,
   id_roles INT NOT NULL,
   PRIMARY KEY(id_roleAssignments),
   FOREIGN KEY(id_roles) REFERENCES roles(id_roles)
);

CREATE TABLE permissions(
   id_permissions INT,
   permissionName VARCHAR(50),
   id_roles INT NOT NULL,
   PRIMARY KEY(id_permissions),
   FOREIGN KEY(id_roles) REFERENCES roles(id_roles)
);

CREATE TABLE apiKeys(
   id_apiKeys INT,
   keytext VARCHAR(50),
   id_users INT,
   PRIMARY KEY(id_apiKeys),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE messages(
   id_messages INT,
   messageContent VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_messages),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE applications(
   id_applications INT,
   appName VARCHAR(50),
   id_users INT,
   PRIMARY KEY(id_applications),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE sessions(
   id_sessions INT,
   loginTime TIME,
   logoutTime TIME,
   id_users INT,
   PRIMARY KEY(id_sessions),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE analytics(
   id_analytics INT,
   metricName VARCHAR(50),
   metricValue VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_analytics),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE streamAnalytics(
   id_streamAnalytics INT,
   metricName VARCHAR(50),
   metricValue VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_streamAnalytics)
);

CREATE TABLE userAnalytics(
   id_userAnalytics INT,
   metricName VARCHAR(50),
   metricValue VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_userAnalytics),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE payments(
   id_payments INT,
   amount DECIMAL(15,2),
   paymentMethod VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_payments),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE payouts(
   id_payouts INT,
   amount DECIMAL(15,2),
   payoutMethod VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_payouts),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE supportTickets(
   id_supportTickets INT,
   issue VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_supportTickets)
);

CREATE TABLE supportResponses(
   id_supportResponses INT,
   responseContent VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_supportResponses)
);

CREATE TABLE surveyResponses(
   id_surveyResponses INT,
   responseContent VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_surveyResponses),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE feedBack(
   id_feedBack INT,
   feedbackContent VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_feedBack),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE termsOfService(
   id_termsOfService INT,
   content VARCHAR(50),
   effectiveDate VARCHAR(50),
   PRIMARY KEY(id_termsOfService)
);

CREATE TABLE blogPosts(
   id_blogPosts INT,
   title VARCHAR(50),
   content VARCHAR(50),
   timeStamps DATETIME,
   id_users INT,
   PRIMARY KEY(id_blogPosts),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE maintenanceLogs(
   id_maintenanceLogs INT,
   serverName VARCHAR(50),
   details VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_maintenanceLogs)
);

CREATE TABLE errorLogs(
   id_errorLogs INT,
   errorCode VARCHAR(50),
   details VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_errorLogs)
);

CREATE TABLE privacyPolicy(
   id_privacyPolicy INT,
   content VARCHAR(50),
   effectiveDate DATE,
   PRIMARY KEY(id_privacyPolicy)
);

CREATE TABLE Announcements(
   id_announcements INT,
   title VARCHAR(50),
   content VARCHAR(50),
   timeStamps DATETIME,
   PRIMARY KEY(id_announcements)
);

CREATE TABLE surveys(
   id_surveys INT,
   surveyName VARCHAR(50),
   description VARCHAR(50),
   PRIMARY KEY(id_surveys)
);

CREATE TABLE badges(
   id_badges INT,
   badgeName VARCHAR(50),
   badgeImageURL VARCHAR(50),
   PRIMARY KEY(id_badges)
);

CREATE TABLE oAuthTokens(
   id_oAuthTokens INT,
   token VARCHAR(50),
   id_applications INT,
   id_users INT,
   PRIMARY KEY(id_oAuthTokens),
   FOREIGN KEY(id_applications) REFERENCES applications(id_applications),
   FOREIGN KEY(id_users) REFERENCES Users(id_users)
);

CREATE TABLE users_chatMessages(
   id_users INT,
   id_chatMessages INT,
   PRIMARY KEY(id_users, id_chatMessages),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_chatMessages) REFERENCES chatMessages(id_chatMessages)
);

CREATE TABLE channels_chatModerators(
   id_channels INT,
   id_chatModerators INT,
   PRIMARY KEY(id_channels, id_chatModerators),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels),
   FOREIGN KEY(id_chatModerators) REFERENCES chatModerators(id_chatModerators)
);

CREATE TABLE users_chatModerators(
   id_users INT,
   id_chatModerators INT,
   PRIMARY KEY(id_users, id_chatModerators),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_chatModerators) REFERENCES chatModerators(id_chatModerators)
);

CREATE TABLE users_chatBans(
   id_users INT,
   id_chatBans INT,
   PRIMARY KEY(id_users, id_chatBans),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_chatBans) REFERENCES chatBans(id_chatBans)
);

CREATE TABLE channels_Chatbans(
   id_channels INT,
   id_chatBans INT,
   PRIMARY KEY(id_channels, id_chatBans),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels),
   FOREIGN KEY(id_chatBans) REFERENCES chatBans(id_chatBans)
);

CREATE TABLE users_bitsTransactions(
   id_users INT,
   id_bitsTransaction INT,
   PRIMARY KEY(id_users, id_bitsTransaction),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_bitsTransaction) REFERENCES bitsTransactions(id_bitsTransaction)
);

CREATE TABLE channels_bitsTransactions(
   id_channels INT,
   id_bitsTransaction INT,
   PRIMARY KEY(id_channels, id_bitsTransaction),
   FOREIGN KEY(id_channels) REFERENCES channels(id_channels),
   FOREIGN KEY(id_bitsTransaction) REFERENCES bitsTransactions(id_bitsTransaction)
);

CREATE TABLE ads_adMetric(
   id_ads INT,
   id_adMetric INT,
   PRIMARY KEY(id_ads, id_adMetric),
   FOREIGN KEY(id_ads) REFERENCES Ads(id_ads),
   FOREIGN KEY(id_adMetric) REFERENCES adMetrics(id_adMetric)
);

CREATE TABLE users_eventParticipants(
   id_users INT,
   id_eventParticipants INT,
   PRIMARY KEY(id_users, id_eventParticipants),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_eventParticipants) REFERENCES eventParticipants(id_eventParticipants)
);

CREATE TABLE users_events(
   id_users INT,
   id_events INT,
   PRIMARY KEY(id_users, id_events),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_events) REFERENCES events(id_events)
);

CREATE TABLE users_achievements(
   id_users INT,
   id_achievements INT,
   PRIMARY KEY(id_users, id_achievements),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_achievements) REFERENCES achievements(id_achievements)
);

CREATE TABLE reports_appeals(
   id_reports INT,
   id_appeals INT,
   PRIMARY KEY(id_reports, id_appeals),
   FOREIGN KEY(id_reports) REFERENCES reports(id_reports),
   FOREIGN KEY(id_appeals) REFERENCES appeals(id_appeals)
);

CREATE TABLE users_friendships(
   id_users INT,
   id_friendships INT,
   PRIMARY KEY(id_users, id_friendships),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_friendships) REFERENCES friendships(id_friendships)
);

CREATE TABLE users_roleAssignments(
   id_users INT,
   id_roleAssignments INT,
   PRIMARY KEY(id_users, id_roleAssignments),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_roleAssignments) REFERENCES roleAssignments(id_roleAssignments)
);

CREATE TABLE stream_streamAnalytics(
   id_stream INT,
   id_streamAnalytics INT,
   PRIMARY KEY(id_stream, id_streamAnalytics),
   FOREIGN KEY(id_stream) REFERENCES streams(id_stream),
   FOREIGN KEY(id_streamAnalytics) REFERENCES streamAnalytics(id_streamAnalytics)
);

CREATE TABLE users_supportTickets(
   id_users INT,
   id_supportTickets INT,
   PRIMARY KEY(id_users, id_supportTickets),
   FOREIGN KEY(id_users) REFERENCES Users(id_users),
   FOREIGN KEY(id_supportTickets) REFERENCES supportTickets(id_supportTickets)
);

CREATE TABLE supportTickets_supportResponses(
   id_supportTickets INT,
   id_supportResponses INT,
   PRIMARY KEY(id_supportTickets, id_supportResponses),
   FOREIGN KEY(id_supportTickets) REFERENCES supportTickets(id_supportTickets),
   FOREIGN KEY(id_supportResponses) REFERENCES supportResponses(id_supportResponses)
);

CREATE TABLE surveys_surveyResponses(
   id_surveyResponses INT,
   id_surveys INT,
   PRIMARY KEY(id_surveyResponses, id_surveys),
   FOREIGN KEY(id_surveyResponses) REFERENCES surveyResponses(id_surveyResponses),
   FOREIGN KEY(id_surveys) REFERENCES surveys(id_surveys)
);
