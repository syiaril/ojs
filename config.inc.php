<?php exit; // DO NOT DELETE
// Config OJS membaca database dari environment variables

function env($key, $default = null) {
    return getenv($key) ?: $default;
}

[general]
app_key =
installed = On
base_url = "<?php echo env('BASE_URL', 'https://ojs.ubig.web.id'); ?>"
strict = Off
session_cookie_name = OJSSID
session_lifetime = 30
session_samesite = Lax
time_zone = "UTC"
date_format_short = "Y-m-d"
date_format_long = "F j, Y"
datetime_format_short = "Y-m-d h:i A"
datetime_format_long = "F j, Y - h:i A"
time_format = "h:i A"

[database]
driver = "<?php echo env('DB_DRIVER', 'mysqli'); ?>"
host = "<?php echo env('DB_HOST', 'localhost'); ?>"
username = "<?php echo env('DB_USERNAME', 'ojs_user'); ?>"
password = "<?php echo env('DB_PASSWORD', 'ojs_pass'); ?>"
name = "<?php echo env('DB_DATABASE', 'ojs_db'); ?>"
port = <?php echo env('DB_PORT', 3306); ?>
ssl = false
debug = Off

[files]
files_dir = "<?php echo env('OJS_FILES_DIR', '/var/www/ojs/files'); ?>"
public_files_dir = "<?php echo env('OJS_PUBLIC_DIR', '/var/www/ojs/public'); ?>"
public_user_dir_size = 5000
umask = 0022
