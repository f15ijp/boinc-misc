SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `min_version` int(11) NOT NULL DEFAULT '0',
  `deprecated` smallint(6) NOT NULL DEFAULT '0',
  `user_friendly_name` varchar(254) NOT NULL,
  `homogeneous_redundancy` smallint(6) NOT NULL DEFAULT '0',
  `weight` double NOT NULL DEFAULT '1',
  `beta` smallint(6) NOT NULL DEFAULT '0',
  `target_nresults` smallint(6) NOT NULL DEFAULT '0',
  `min_avg_pfc` double NOT NULL DEFAULT '1',
  `host_scale_check` tinyint(4) NOT NULL DEFAULT '0',
  `homogeneous_app_version` tinyint(4) NOT NULL DEFAULT '0',
  `non_cpu_intensive` tinyint(4) NOT NULL DEFAULT '0',
  `locality_scheduling` int(11) NOT NULL DEFAULT '0',
  `n_size_classes` smallint(6) NOT NULL DEFAULT '0',
  `fraction_done_exact` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_version`
--

CREATE TABLE `app_version` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `version_num` int(11) NOT NULL,
  `platformid` int(11) NOT NULL,
  `xml_doc` mediumblob,
  `min_core_version` int(11) NOT NULL DEFAULT '0',
  `max_core_version` int(11) NOT NULL DEFAULT '0',
  `deprecated` tinyint(4) NOT NULL DEFAULT '0',
  `plan_class` varchar(254) NOT NULL DEFAULT '',
  `pfc_n` double NOT NULL DEFAULT '0',
  `pfc_avg` double NOT NULL DEFAULT '0',
  `pfc_scale` double NOT NULL DEFAULT '0',
  `expavg_credit` double NOT NULL DEFAULT '0',
  `expavg_time` double NOT NULL DEFAULT '0',
  `beta` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `target_type` int(11) NOT NULL,
  `multi` tinyint(4) NOT NULL,
  `workunitid` int(11) NOT NULL,
  `resultid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badge`
--

CREATE TABLE `badge` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `create_time` double NOT NULL,
  `type` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `sql_rule` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badge_team`
--

CREATE TABLE `badge_team` (
  `badge_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `reassign_time` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `badge_user`
--

CREATE TABLE `badge_user` (
  `badge_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` double NOT NULL,
  `reassign_time` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banishment_vote`
--

CREATE TABLE `banishment_vote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` int(11) NOT NULL,
  `modid` int(11) NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banishment_votes`
--

CREATE TABLE `banishment_votes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voteid` int(11) NOT NULL,
  `modid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `yes` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `logical_start_time` double NOT NULL,
  `logical_end_time` double NOT NULL,
  `est_completion_time` double NOT NULL,
  `njobs` int(11) NOT NULL,
  `fraction_done` double NOT NULL,
  `nerror_jobs` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `completion_time` double NOT NULL,
  `credit_estimate` double NOT NULL,
  `credit_canonical` double NOT NULL,
  `credit_total` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `app_id` int(11) NOT NULL,
  `project_state` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `expire_time` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `name` varchar(254) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `is_helpdesk` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credited_job`
--

CREATE TABLE `credited_job` (
  `userid` int(11) NOT NULL,
  `workunitid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_team`
--

CREATE TABLE `credit_team` (
  `teamid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `njobs` int(11) NOT NULL,
  `total` double NOT NULL,
  `expavg` double NOT NULL,
  `expavg_time` double NOT NULL,
  `credit_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit_user`
--

CREATE TABLE `credit_user` (
  `userid` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `njobs` int(11) NOT NULL,
  `total` double NOT NULL,
  `expavg` double NOT NULL,
  `expavg_time` double NOT NULL,
  `credit_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation_items`
--

CREATE TABLE `donation_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `required` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation_paypal`
--

CREATE TABLE `donation_paypal` (
  `id` int(11) NOT NULL,
  `order_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `email_addr` varchar(255) NOT NULL,
  `order_amount` double(6,2) NOT NULL,
  `processed` tinyint(4) NOT NULL DEFAULT '0',
  `payment_time` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_amount` double(6,2) NOT NULL,
  `payment_fee` double(5,2) DEFAULT NULL,
  `payment_currency` varchar(255) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `receiver_email` varchar(255) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `payer_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `title` varchar(254) NOT NULL,
  `description` varchar(254) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `threads` int(11) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `rate_min_expavg_credit` int(11) NOT NULL DEFAULT '0',
  `rate_min_total_credit` int(11) NOT NULL DEFAULT '0',
  `post_min_interval` int(11) NOT NULL DEFAULT '0',
  `post_min_expavg_credit` int(11) NOT NULL DEFAULT '0',
  `post_min_total_credit` int(11) NOT NULL DEFAULT '0',
  `is_dev_blog` tinyint(4) NOT NULL DEFAULT '0',
  `parent_type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_logging`
--

CREATE TABLE `forum_logging` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `threadid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum_preferences`
--

CREATE TABLE `forum_preferences` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `signature` varchar(254) NOT NULL DEFAULT '',
  `posts` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL,
  `avatar` varchar(254) NOT NULL DEFAULT '',
  `hide_avatars` tinyint(4) NOT NULL DEFAULT '0',
  `forum_sorting` int(11) NOT NULL,
  `thread_sorting` int(11) NOT NULL,
  `no_signature_by_default` tinyint(4) NOT NULL DEFAULT '1',
  `images_as_links` tinyint(4) NOT NULL DEFAULT '0',
  `link_popup` tinyint(4) NOT NULL DEFAULT '0',
  `mark_as_read_timestamp` int(11) NOT NULL DEFAULT '0',
  `special_user` char(12) NOT NULL DEFAULT '0',
  `jump_to_unread` tinyint(4) NOT NULL DEFAULT '1',
  `hide_signatures` tinyint(4) NOT NULL DEFAULT '0',
  `rated_posts` varchar(254) NOT NULL,
  `low_rating_threshold` int(11) NOT NULL DEFAULT '-25',
  `high_rating_threshold` int(11) NOT NULL DEFAULT '5',
  `minimum_wrap_postcount` int(11) NOT NULL DEFAULT '100',
  `display_wrap_postcount` int(11) NOT NULL DEFAULT '75',
  `ignorelist` varchar(254) NOT NULL,
  `ignore_sticky_posts` tinyint(4) NOT NULL DEFAULT '0',
  `banished_until` int(11) NOT NULL DEFAULT '0',
  `pm_notification` tinyint(4) NOT NULL DEFAULT '0',
  `highlight_special` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE `friend` (
  `user_src` int(11) NOT NULL,
  `user_dest` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `reciprocated` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `host`
--

CREATE TABLE `host` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `rpc_seqno` int(11) NOT NULL,
  `rpc_time` int(11) NOT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `timezone` int(11) NOT NULL,
  `domain_name` varchar(254) DEFAULT NULL,
  `serialnum` varchar(254) DEFAULT NULL,
  `last_ip_addr` varchar(254) DEFAULT NULL,
  `nsame_ip_addr` int(11) NOT NULL,
  `on_frac` double NOT NULL,
  `connected_frac` double NOT NULL,
  `active_frac` double NOT NULL,
  `cpu_efficiency` double NOT NULL,
  `duration_correction_factor` double NOT NULL,
  `p_ncpus` int(11) NOT NULL,
  `p_vendor` varchar(254) DEFAULT NULL,
  `p_model` varchar(254) DEFAULT NULL,
  `p_fpops` double NOT NULL,
  `p_iops` double NOT NULL,
  `p_membw` double NOT NULL,
  `os_name` varchar(254) DEFAULT NULL,
  `os_version` varchar(254) DEFAULT NULL,
  `m_nbytes` double NOT NULL,
  `m_cache` double NOT NULL,
  `m_swap` double NOT NULL,
  `d_total` double NOT NULL,
  `d_free` double NOT NULL,
  `d_boinc_used_total` double NOT NULL,
  `d_boinc_used_project` double NOT NULL,
  `d_boinc_max` double NOT NULL,
  `n_bwup` double NOT NULL,
  `n_bwdown` double NOT NULL,
  `credit_per_cpu_sec` double NOT NULL,
  `venue` varchar(254) NOT NULL,
  `nresults_today` int(11) NOT NULL,
  `avg_turnaround` double NOT NULL,
  `host_cpid` varchar(254) DEFAULT NULL,
  `external_ip_addr` varchar(254) DEFAULT NULL,
  `max_results_day` int(11) NOT NULL,
  `error_rate` double NOT NULL DEFAULT '0',
  `product_name` varchar(254) NOT NULL,
  `gpu_active_frac` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `host_app_version`
--

CREATE TABLE `host_app_version` (
  `host_id` int(11) NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `pfc_n` double NOT NULL,
  `pfc_avg` double NOT NULL,
  `et_n` double NOT NULL,
  `et_avg` double NOT NULL,
  `et_var` double NOT NULL,
  `et_q` double NOT NULL,
  `max_jobs_per_day` int(11) NOT NULL,
  `n_jobs_today` int(11) NOT NULL,
  `turnaround_n` double NOT NULL,
  `turnaround_avg` double NOT NULL,
  `turnaround_var` double NOT NULL,
  `turnaround_q` double NOT NULL,
  `consecutive_valid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_file`
--

CREATE TABLE `job_file` (
  `id` int(11) NOT NULL,
  `md5` char(64) NOT NULL,
  `create_time` double NOT NULL,
  `delete_time` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msg_from_host`
--

CREATE TABLE `msg_from_host` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `variety` varchar(254) NOT NULL,
  `handled` smallint(6) NOT NULL,
  `xml` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `msg_to_host`
--

CREATE TABLE `msg_to_host` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `variety` varchar(254) NOT NULL,
  `handled` smallint(6) NOT NULL,
  `xml` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notify`
--

CREATE TABLE `notify` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `opaque` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `user_friendly_name` varchar(254) NOT NULL,
  `deprecated` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `content` text NOT NULL,
  `modified` int(11) NOT NULL,
  `parent_post` int(11) NOT NULL,
  `score` double NOT NULL,
  `votes` int(11) NOT NULL,
  `signature` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_ratings`
--

CREATE TABLE `post_ratings` (
  `post` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `private_messages`
--

CREATE TABLE `private_messages` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `senderid` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `opened` tinyint(4) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `userid` int(11) NOT NULL,
  `language` varchar(254) DEFAULT NULL,
  `response1` text,
  `response2` text,
  `has_picture` smallint(6) NOT NULL,
  `recommend` int(11) NOT NULL,
  `reject` int(11) NOT NULL,
  `posts` int(11) NOT NULL,
  `uotd_time` int(11) DEFAULT NULL,
  `verification` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `workunitid` int(11) NOT NULL,
  `server_state` int(11) NOT NULL,
  `outcome` int(11) NOT NULL,
  `client_state` int(11) NOT NULL,
  `hostid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `report_deadline` int(11) NOT NULL,
  `sent_time` int(11) NOT NULL,
  `received_time` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `cpu_time` double NOT NULL,
  `xml_doc_in` blob,
  `xml_doc_out` blob,
  `stderr_out` blob,
  `batch` int(11) NOT NULL,
  `file_delete_state` int(11) NOT NULL,
  `validate_state` int(11) NOT NULL,
  `claimed_credit` double NOT NULL,
  `granted_credit` double NOT NULL,
  `opaque` double NOT NULL,
  `random` int(11) NOT NULL,
  `app_version_num` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `exit_status` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `elapsed_time` double NOT NULL,
  `flops_estimate` double NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `runtime_outlier` tinyint(4) NOT NULL,
  `size_class` smallint(6) NOT NULL DEFAULT '-1',
  `peak_working_set_size` double NOT NULL,
  `peak_swap_size` double NOT NULL,
  `peak_disk_usage` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sent_email`
--

CREATE TABLE `sent_email` (
  `userid` int(11) NOT NULL,
  `time_sent` int(11) NOT NULL,
  `email_type` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `userid` int(11) NOT NULL,
  `threadid` int(11) NOT NULL,
  `notified_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `name_lc` varchar(254) DEFAULT NULL,
  `url` varchar(254) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `name_html` varchar(254) DEFAULT NULL,
  `description` text,
  `nusers` int(11) NOT NULL,
  `country` varchar(254) DEFAULT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `seti_id` int(11) NOT NULL,
  `ping_user` int(11) NOT NULL DEFAULT '0',
  `ping_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `joinable` tinyint(4) NOT NULL DEFAULT '1',
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_admin`
--

CREATE TABLE `team_admin` (
  `teamid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `rights` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_delta`
--

CREATE TABLE `team_delta` (
  `userid` int(11) NOT NULL,
  `teamid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `joining` tinyint(4) NOT NULL,
  `total_credit` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `id` int(11) NOT NULL,
  `forum` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(254) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `replies` int(11) NOT NULL,
  `activity` double NOT NULL,
  `sufferers` int(11) NOT NULL,
  `score` double NOT NULL,
  `votes` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `hidden` int(11) NOT NULL,
  `sticky` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `email_addr` varchar(254) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `authenticator` varchar(254) DEFAULT NULL,
  `country` varchar(254) DEFAULT NULL,
  `postal_code` varchar(254) DEFAULT NULL,
  `total_credit` double NOT NULL,
  `expavg_credit` double NOT NULL,
  `expavg_time` double NOT NULL,
  `global_prefs` blob,
  `project_prefs` blob,
  `teamid` int(11) NOT NULL,
  `venue` varchar(254) NOT NULL,
  `url` varchar(254) DEFAULT NULL,
  `send_email` smallint(6) NOT NULL,
  `show_hosts` smallint(6) NOT NULL,
  `posts` smallint(6) NOT NULL,
  `seti_id` int(11) NOT NULL,
  `seti_nresults` int(11) NOT NULL,
  `seti_last_result_time` int(11) NOT NULL,
  `seti_total_cpu` double NOT NULL,
  `signature` varchar(254) DEFAULT NULL,
  `has_profile` smallint(6) NOT NULL,
  `cross_project_id` varchar(254) NOT NULL,
  `passwd_hash` varchar(254) NOT NULL,
  `email_validated` smallint(6) NOT NULL,
  `donated` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_submit`
--

CREATE TABLE `user_submit` (
  `user_id` int(11) NOT NULL,
  `quota` double NOT NULL,
  `logical_start_time` double NOT NULL,
  `submit_all` tinyint(4) NOT NULL,
  `manage_all` tinyint(4) NOT NULL,
  `max_jobs_in_progress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_submit_app`
--

CREATE TABLE `user_submit_app` (
  `user_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `manage` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workunit`
--

CREATE TABLE `workunit` (
  `id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `appid` int(11) NOT NULL,
  `name` varchar(254) NOT NULL,
  `xml_doc` blob,
  `batch` int(11) NOT NULL,
  `rsc_fpops_est` double NOT NULL,
  `rsc_fpops_bound` double NOT NULL,
  `rsc_memory_bound` double NOT NULL,
  `rsc_disk_bound` double NOT NULL,
  `need_validate` smallint(6) NOT NULL,
  `canonical_resultid` int(11) NOT NULL,
  `canonical_credit` double NOT NULL,
  `transition_time` int(11) NOT NULL,
  `delay_bound` int(11) NOT NULL,
  `error_mask` int(11) NOT NULL,
  `file_delete_state` int(11) NOT NULL,
  `assimilate_state` int(11) NOT NULL,
  `hr_class` int(11) NOT NULL,
  `opaque` double NOT NULL,
  `min_quorum` int(11) NOT NULL,
  `target_nresults` int(11) NOT NULL,
  `max_error_results` int(11) NOT NULL,
  `max_total_results` int(11) NOT NULL,
  `max_success_results` int(11) NOT NULL,
  `result_template_file` varchar(63) NOT NULL,
  `priority` int(11) NOT NULL,
  `mod_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rsc_bandwidth_bound` double NOT NULL,
  `fileset_id` int(11) NOT NULL,
  `app_version_id` int(11) NOT NULL,
  `transitioner_flags` tinyint(4) NOT NULL,
  `size_class` smallint(6) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apvp` (`appid`,`platformid`,`version_num`,`plan_class`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asgn_target` (`target_type`,`target_id`);

--
-- Indexes for table `badge`
--
ALTER TABLE `badge`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `badge_team`
--
ALTER TABLE `badge_team`
  ADD UNIQUE KEY `team_id` (`team_id`,`badge_id`);

--
-- Indexes for table `badge_user`
--
ALTER TABLE `badge_user`
  ADD UNIQUE KEY `user_id` (`user_id`,`badge_id`);

--
-- Indexes for table `banishment_vote`
--
ALTER TABLE `banishment_vote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `banishment_votes`
--
ALTER TABLE `banishment_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cat1` (`name`,`is_helpdesk`);

--
-- Indexes for table `credited_job`
--
ALTER TABLE `credited_job`
  ADD UNIQUE KEY `credited_job_user_wu` (`userid`,`workunitid`),
  ADD KEY `credited_job_user` (`userid`),
  ADD KEY `credited_job_wu` (`workunitid`);

--
-- Indexes for table `credit_team`
--
ALTER TABLE `credit_team`
  ADD PRIMARY KEY (`teamid`,`appid`,`credit_type`);

--
-- Indexes for table `credit_user`
--
ALTER TABLE `credit_user`
  ADD PRIMARY KEY (`userid`,`appid`,`credit_type`);

--
-- Indexes for table `donation_items`
--
ALTER TABLE `donation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `donation_paypal`
--
ALTER TABLE `donation_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pct` (`parent_type`,`category`,`title`);

--
-- Indexes for table `forum_logging`
--
ALTER TABLE `forum_logging`
  ADD PRIMARY KEY (`userid`,`threadid`);

--
-- Indexes for table `forum_preferences`
--
ALTER TABLE `forum_preferences`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD UNIQUE KEY `friend_u` (`user_src`,`user_dest`);

--
-- Indexes for table `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `host_user` (`userid`),
  ADD KEY `host_avg` (`expavg_credit`),
  ADD KEY `host_tot` (`total_credit`);

--
-- Indexes for table `host_app_version`
--
ALTER TABLE `host_app_version`
  ADD UNIQUE KEY `hap` (`host_id`,`app_version_id`);

--
-- Indexes for table `job_file`
--
ALTER TABLE `job_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jf_md5` (`md5`);

--
-- Indexes for table `msg_from_host`
--
ALTER TABLE `msg_from_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_handled` (`handled`);

--
-- Indexes for table `msg_to_host`
--
ALTER TABLE `msg_to_host`
  ADD PRIMARY KEY (`id`),
  ADD KEY `msg_to_host` (`hostid`,`handled`);

--
-- Indexes for table `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `notify_un` (`userid`,`type`,`opaque`);

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user` (`user`),
  ADD KEY `post_thread` (`thread`);
ALTER TABLE `post` ADD FULLTEXT KEY `post_content` (`content`);

--
-- Indexes for table `post_ratings`
--
ALTER TABLE `post_ratings`
  ADD PRIMARY KEY (`post`,`user`);

--
-- Indexes for table `private_messages`
--
ALTER TABLE `private_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `profile_userid` (`userid`),
  ADD KEY `pro_uotd` (`uotd_time`);
ALTER TABLE `profile` ADD FULLTEXT KEY `profile_reponse` (`response1`,`response2`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `res_wuid` (`workunitid`),
  ADD KEY `ind_res_st` (`server_state`,`priority`),
  ADD KEY `res_app_state` (`appid`,`server_state`),
  ADD KEY `res_filedel` (`file_delete_state`),
  ADD KEY `res_userid_id` (`userid`,`id`),
  ADD KEY `res_userid_val` (`userid`,`validate_state`),
  ADD KEY `res_hostid_id` (`hostid`,`id`),
  ADD KEY `res_wu_user` (`workunitid`,`userid`);

--
-- Indexes for table `sent_email`
--
ALTER TABLE `sent_email`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD UNIQUE KEY `sub_unique` (`userid`,`threadid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `team_avg` (`expavg_credit`),
  ADD KEY `team_tot` (`total_credit`),
  ADD KEY `team_userid` (`userid`);
ALTER TABLE `team` ADD FULLTEXT KEY `team_name_desc` (`name`,`description`);
ALTER TABLE `team` ADD FULLTEXT KEY `team_name` (`name`);

--
-- Indexes for table `team_admin`
--
ALTER TABLE `team_admin`
  ADD UNIQUE KEY `teamid` (`teamid`,`userid`);

--
-- Indexes for table `team_delta`
--
ALTER TABLE `team_delta`
  ADD KEY `team_delta_teamid` (`teamid`,`timestamp`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `thread` ADD FULLTEXT KEY `thread_title` (`title`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_addr` (`email_addr`),
  ADD UNIQUE KEY `authenticator` (`authenticator`),
  ADD KEY `ind_tid` (`teamid`),
  ADD KEY `user_name` (`name`),
  ADD KEY `user_tot` (`total_credit`),
  ADD KEY `user_avg` (`expavg_credit`);

--
-- Indexes for table `user_submit`
--
ALTER TABLE `user_submit`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_submit_app`
--
ALTER TABLE `user_submit_app`
  ADD PRIMARY KEY (`user_id`,`app_id`);

--
-- Indexes for table `workunit`
--
ALTER TABLE `workunit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `wu_val` (`appid`,`need_validate`),
  ADD KEY `wu_timeout` (`transition_time`),
  ADD KEY `wu_filedel` (`file_delete_state`),
  ADD KEY `wu_assim` (`appid`,`assimilate_state`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `badge`
--
ALTER TABLE `badge`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banishment_vote`
--
ALTER TABLE `banishment_vote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banishment_votes`
--
ALTER TABLE `banishment_votes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `donation_items`
--
ALTER TABLE `donation_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `donation_paypal`
--
ALTER TABLE `donation_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `host`
--
ALTER TABLE `host`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `job_file`
--
ALTER TABLE `job_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `msg_from_host`
--
ALTER TABLE `msg_from_host`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `msg_to_host`
--
ALTER TABLE `msg_to_host`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notify`
--
ALTER TABLE `notify`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `platform`
--
ALTER TABLE `platform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `private_messages`
--
ALTER TABLE `private_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `workunit`
--
ALTER TABLE `workunit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
