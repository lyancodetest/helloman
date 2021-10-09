CREATE DATABASE IF NOT EXISTS kudu_analysis;


CREATE TABLE kudu_analysis.welab_events (
	pk_id_ BIGINT NOT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_name STRING NOT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_mark_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_id BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	lib_version STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	lib STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	screen_width INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	screen_height INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	device_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	device_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	device_brand STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	os_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	os_version STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	os_version_build STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	browser_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	browser_version STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	cpu_bits INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	cpu_cores INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	browser_bpix INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	browser_language STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_first_day INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_first_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_online INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	network_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	title STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	url STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	url_host STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	url_domain STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	referrer STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	referrer_host STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	nation STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	province STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	city STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	isp STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ip STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_position INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_title STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_content STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_selector STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_target_url STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latest_search_keyword STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latest_traffic_source_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latest_referrer STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latest_referrer_host STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latest_referrer_domain STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	viewport_width INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	viewport_height INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	viewport_position INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_duration INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	dns_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	tcp_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ttfb_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	dom_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	res_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	firstbyte_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	fpt_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	tti_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ready_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	load_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	utm_source STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	utm_medium STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	utm_term STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	utm_content STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	utm_campaign STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_mobile STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_identity STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_product_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_source_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_partner_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_flag STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_origin STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_app_version STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	application_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_application_id BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_simulator INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	model STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	manufacturer STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	channel STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	latitude DOUBLE NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	longitude DOUBLE NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	address STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	wifi STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	banner_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	banner_number INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	amount STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	tenor STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	operator_auth INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	process STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	login INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	loan_amount STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	period STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	fail_reason STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	relationship STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	element_sub_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	register_channel_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	subapply_channel_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	credit_user INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	api_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	api_result INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	api_content STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_first_login INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	validation_result INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	wedefend_score INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	wifi_mac STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ocr_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ocr_cnid STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	apply_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_millis BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_type INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_timestamp INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	subapply_audit_time TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	gps_address STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	pay_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	subapply_product_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_level STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	gps_type STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_hour INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_day INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_week INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_month INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_date_time STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	create_date_time STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_minute INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	update_date_time STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	car_no STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	shop_no STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	shop_url STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	fail_count INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	cost_time FLOAT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	audit_status STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
PRIMARY KEY ( pk_id_ ) 
) PARTITION BY HASH ( pk_id_ ) PARTITIONS 30 STORED AS KUDU;


CREATE TABLE kudu_analysis.welab_users (
	x_user_id BIGINT NOT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	id BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	mobile STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	encrypted_password STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	reset_password_token STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	reset_password_sent_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	sign_in_count INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	current_sign_in_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	last_sign_in_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	current_sign_in_ip STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	last_sign_in_ip STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	confirmed_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	failed_attempts INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	unlock_token STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	locked_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	created_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	updated_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	authentication_token STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	screen_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	member_id STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	blocked INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	to_receive_newsletter INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	email_confirmed TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	device_info STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	encrypted_security_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_agent STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	origin STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	agent INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	referee_id BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	role_type INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	product_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	channel_code STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	invite_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	sec_failed_attempts INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	uuid BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	mobile_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_uuid BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_created_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_updated_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_origin BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_product_code BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	email STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	email_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_reset_password_sent_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_current_sign_in_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_last_sign_in_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_confirmed_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_locked_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_created_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_updated_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_email_confirmed BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_invite_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_created_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_user_updated_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_email STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_email_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	NAME STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	gender STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	borrower_id BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	cnid STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	profile_created_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	profile_updated_at TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	verified INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	education_level_id INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	enter_school_date TIMESTAMP NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	position_id INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	marriage INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	qq STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	cnid_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	name_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	qq_encrypt STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	birth_year INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	birth_month INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	birth_date INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	user_name STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_profile_created_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_profile_updated_at BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	x_enter_school_date BIGINT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	is_active_ STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	ums_id_ STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	create_date_time STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	update_date_time STRING NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_hour INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_day INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_week INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_month INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
	event_time_minute INT NULL ENCODING AUTO_ENCODING COMPRESSION DEFAULT_COMPRESSION,
PRIMARY KEY ( x_user_id ) 
) PARTITION BY HASH ( x_user_id ) PARTITIONS 16 STORED AS KUDU;