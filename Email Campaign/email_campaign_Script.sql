create database email_campaign;
use email_campaign;

-- lookup for email groups
create table email_groups(
	id int auto_increment,
    temp_type varchar(25),
    primary key(id)
);

-- Main: emails 
create table emails(
	email_id int auto_increment,
    email varchar(25),
    email_groups_id int,
    primary key(email_id),
    foreign key (email_groups_id) references email_groups(id)
);
-- ------------------------------------------------------------
-- lookup for template type
create table template_types(
	id int auto_increment,
    temp_type varchar(25),
    primary key(id)
);
-- Main : template
create table template(
	template_id int auto_increment,
    template varchar(25),
    template_type_id int,
    primary key(template_id),
    foreign key(template_type_id) references template_types(id)
);

-- --------------------------------------------------------------
-- look up campaign tables
create table campaign_types(
	id int auto_increment,
    camp_type varchar(25),
    primary key(id)
);
-- Main : Campaign
create table campaign(
	campaign_id int auto_increment,
    campaign_name varchar(25),
    campaign_type_id int,
    primary key(campaign_id),
    foreign key(campaign_type_id) references campaign_types(id)
);
-- ----------------------------------------------------------------
-- ----------------------------------------------------------------
-- mapping table campaign and template
create table campaign_template(
	id int auto_increment,
    campaign_id int,
    template_id int,
    primary key(id),
    foreign key(campaign_id) references campaign(campaign_id),
    foreign key(template_id) references template(template_id)
);

-- mapping table for connection of email
create table email_send_log(
	email_id int,
    campaign_temp_id int,
    primary key (email_id, campaign_temp_id),
    foreign key (email_id) references emails(email_id),
    foreign key (campaign_temp_id) references campaign_template(id)
);

-- -----------------------------------------------------------------
-- -----------------------------------------------------------------

