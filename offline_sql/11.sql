# seatunnel version 2.3.10
# bigdata env CDH 6.3.2

# sync_mysql_to_hive_tbl_insurance_area.conf

env {
    parallelism = 2
    job.mode = "BATCH"
}

source{
    Jdbc {
        url = "jdbc:mysql://cdh03:3306/test?serverTimezone=GMT%2b8&useUnicode=true&characterEncoding=UTF-8&rewriteBatchedStatements=true&useSSL=false&allowPublicKeyRetrieval=true"
        driver = "com.mysql.cj.jdbc.Driver"
        connection_check_timeout_sec = 100
        user = "root"
        password = "root"
        query = "select id, activity_id, activity_type, condition_amount, condition_num, benefit_amount, benefit_discount, benefit_level, create_time, operate_time, DATE_FORMAT(NOW(), '%Y%m%d') as ds from test.activity_rule;"
    }
}

transform {

}

sink {
    console{}
}