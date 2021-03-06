DROP TABLE IF EXISTS travistorrent_27_10_2016;
CREATE TABLE travistorrent_27_10_2016 (
  `row` bigint(20) NOT NULL,
  `git_commit` text,
  `gh_project_name` text,
  `gh_is_pr` tinyint(4) DEFAULT NULL,
  `git_merged_with` text,
  `gh_lang` text,
  `git_branch` text,
  `gh_first_commit_created_at` datetime DEFAULT NULL,
  `gh_team_size` bigint(20) DEFAULT NULL,
  `git_commits` text,
  `git_num_commits` bigint(20) DEFAULT NULL,
  `gh_num_issue_comments` bigint(20) DEFAULT NULL,
  `gh_num_commit_comments` bigint(20) DEFAULT NULL,
  `gh_num_pr_comments` bigint(20) DEFAULT NULL,
  `gh_src_churn` bigint(20) DEFAULT NULL,
  `gh_test_churn` bigint(20) DEFAULT NULL,
  `gh_files_added` bigint(20) DEFAULT NULL,
  `gh_files_deleted` bigint(20) DEFAULT NULL,
  `gh_files_modified` bigint(20) DEFAULT NULL,
  `gh_tests_added` bigint(20) DEFAULT NULL,
  `gh_tests_deleted` bigint(20) DEFAULT NULL,
  `gh_src_files` bigint(20) DEFAULT NULL,
  `gh_doc_files` bigint(20) DEFAULT NULL,
  `gh_other_files` bigint(20) DEFAULT NULL,
  `gh_commits_on_files_touched` bigint(20) DEFAULT NULL,
  `gh_sloc` bigint(20) DEFAULT NULL,
  `gh_test_lines_per_kloc` double DEFAULT NULL,
  `gh_test_cases_per_kloc` double DEFAULT NULL,
  `gh_asserts_cases_per_kloc` double DEFAULT NULL,
  `gh_by_core_team_member` tinyint(4) DEFAULT NULL,
  `gh_description_complexity` bigint(20) DEFAULT NULL,
  `tr_build_id` bigint(20) DEFAULT NULL,
  `gh_pull_req_num` bigint(20) DEFAULT NULL,
  `tr_status` text,
  `tr_duration` bigint(20) DEFAULT NULL,
  `tr_started_at` datetime DEFAULT NULL,
  `tr_jobs` text,
  `tr_build_number` bigint(20) DEFAULT NULL,
  `tr_job_id` bigint(20) DEFAULT NULL,
  `tr_lan` text,
  `tr_setup_time` bigint(20) DEFAULT NULL,
  `tr_analyzer` text,
  `tr_frameworks` text,
  `tr_tests_ok` bigint(20) DEFAULT NULL,
  `tr_tests_fail` bigint(20) DEFAULT NULL,
  `tr_tests_run` bigint(20) DEFAULT NULL,
  `tr_tests_skipped` bigint(20) DEFAULT NULL,
  `tr_failed_tests` text,
  `tr_testduration` text,
  `tr_purebuildduration` text,
  `tr_tests_ran` tinyint(4) DEFAULT NULL,
  `tr_tests_failed` tinyint(4) DEFAULT NULL,
  `git_num_committers` text,
  `tr_num_jobs` text,
  `tr_prev_build` text,
  `tr_ci_latency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`row`),
  UNIQUE KEY `row_UNIQUE` (`row`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;