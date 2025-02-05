<?php
define('DB_NAME','my_database');
define('DB_USER', 'my_user');
define('DB_PASSWORD', 'my_password');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');

// 보안 키 및 솔트
define('AUTH_KEY',         ':t_)).*#UMvf(ap`:hMOq-DDI-[g-1MyY!lv$Hx1m./MGPn|Y[1{}d8~6kYg9nfw');
define('SECURE_AUTH_KEY',  '+TS8&;/Z{b$UYn7f`!djC68/>~BU-YGh:*J=J-kCoLf%_?D}W|L1ENPw1zRrSi[+');
define('LOGGED_IN_KEY',    'xg3Qiac#xl|W@b_7CKR|km12*/*Biy(X*vv4,H?[j]?fVb,>=%b+)t7o+,ZuQkJJ');
define('NONCE_KEY',        '`,3N>-sy@SDH,6thXbA c|IH[{^+`jI-(23Pva9y{V;S!9>tkDQ|07Fcfzd|YYYI');
define('AUTH_SALT',        'h8[M~c,x@V|)t@FW{|z&QFh=o`yLTCO*.nr5,VVdO~5]gApo#ZjL:CDn|qJ`fdzp');
define('SECURE_AUTH_SALT', '+#xpd$Q(P1@&iK4O[+6IA>!)KVoUG3P1pOn](o7WNnr,kHnd fP+#Gc!_[Y,lnP+');
define('LOGGED_IN_SALT',   'gB0MLG+%EU :abcg%<3sW:HH<+e%xk~|c>YP?]fa@#1UH^xm9C:wP}^1=;t8fC03');
define('NONCE_SALT',       ',A]9e^?M/AMrtQZ#.w!:O#-BWyTd^G_?#1Z<Qu=4)7O1?-^BuO5/_U]?^?hKnb U');

// 테이블 프리픽스
$table_prefix = 'wp_';

// 끝에 반드시 추가
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';