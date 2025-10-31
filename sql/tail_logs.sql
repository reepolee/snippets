SET global general_log = on;
SET global general_log_file='/tmp/mysql.log';
SET global log_output = 'file';

-- tail it from cli:
-- podman exec -it mariadb tail -f /tmp/mysql.log