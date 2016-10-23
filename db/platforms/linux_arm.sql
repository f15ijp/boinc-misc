INSERT IGNORE INTO platform (create_time, name, user_friendly_name) VALUES(UNIX_TIMESTAMP(NOW()), 'arm-unknown-linux-gnueabi', 'Linux running on arm V5');
INSERT IGNORE INTO platform (create_time, name, user_friendly_name) VALUES(UNIX_TIMESTAMP(NOW()), 'arm-unknown-linux-gnueabihf', 'Linux running on ARM V6 or V7');
INSERT IGNORE INTO platform (create_time, name, user_friendly_name) VALUES(UNIX_TIMESTAMP(NOW()), 'aarch64-unknown-linux-gnueabi', '(arch)Linux running on ARM V8');
