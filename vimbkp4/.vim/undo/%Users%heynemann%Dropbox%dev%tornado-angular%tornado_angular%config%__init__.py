Vim�UnDo� 9T��<Y鷧c�8��{����R��;��`��      HConfig.define('WORKER_SLEEP_TIME', 10, 'Main loop sleep time', 'Worker')                             S�'�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             S��     �                MINUTE = 605�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S��     �                HOUR = MINUTE * 605�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S��     �                DAY = 24 * HOUR5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S��     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S��     �                HConfig.define('WORKER_SLEEP_TIME', 10, 'Main loop sleep time', 'Worker')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S��    �             �   (Config.define('ZOMBIE_WORKER_TIME', 200,   x              'Time to remove a Worker from API List (must be greater than WORKER_SLEEP_TIME + Validation time)', 'API')       �Config.define('WORKERS_LOOK_AHEAD_PAGES', 1000, 'Number of pages that will be retrieved when looking for the next job', 'Worker')       mConfig.define('UPDATE_PAGES_SCORE_EXPIRATION', 30, 'The expiration for lock to update pages score', 'Worker')   oConfig.define('UPDATE_PAGES_SCORE_SLEEP_TIME', HOUR, 'The expiration for lock to update pages score', 'Worker')       eConfig.define('CONNECT_TIMEOUT_IN_SECONDS', 20, 'Number of seconds a connection can take.', 'Worker')   bConfig.define('REQUEST_TIMEOUT_IN_SECONDS', 60, 'Number of seconds a request can take.', 'Worker')       oConfig.define('HOLMES_API_URL', 'http://localhost:2368', 'URL that Worker will communicate with API', 'Worker')       CConfig.define('LOG_LEVEL', 'ERROR', 'Default log level', 'Logging')   QConfig.define('LOG_FORMAT', '%(asctime)s:%(levelname)s %(module)s - %(message)s',   K              'Log Format to be used when writing log messages', 'Logging')   5Config.define('LOG_DATE_FORMAT', '%Y-%m-%d %H:%M:%S',   M              'Date Format to be used when writing log messages.', 'Logging')       VConfig.define('FACTERS', [], 'List of classes to get facts about a website', 'Review')   RConfig.define('VALIDATORS', [], 'List of classes to validate a website', 'Review')   sConfig.define('REVIEW_EXPIRATION_IN_SECONDS', 6 * 60 * 60, 'Number of seconds that a review expires in.', 'Review')   \Config.define('NUMBER_OF_REVIEWS_TO_KEEP', 4, 'Maximum number of reviews to keep', 'Review')       YConfig.define('DAYS_TO_KEEP_REQUESTS', 12, 'Number of days to keep requests', 'Requests')   oConfig.define('MAX_REQUESTS_FOR_FAILED_RESPONSES', 1000, 'Number of requests for falied responses', 'Requests')       0Config.define('MAX_ENQUEUE_BUFFER_LENGTH', 1000,   ^              'Number of urls to enqueue before submitting to the /pages route', 'Validators')       ;# Reference data retrieved from HTTP Archive in 06-jan-2014   .Config.define('MAX_IMG_REQUESTS_PER_PAGE', 40,   M              'Maximum number of images per page', 'Image Request Validator')   (Config.define('MAX_KB_SINGLE_IMAGE', 26,   J              'Maximum size of a single image', 'Image Request Validator')   *Config.define('MAX_IMG_KB_PER_PAGE', 1028,   K              'Maximum size of images per page', 'Image Request Validator')   ;# Reference data retrieved from HTTP Archive in 06-jan-2014   -Config.define('MAX_CSS_REQUESTS_PER_PAGE', 8,   Y              'Maximum number of external stylesheets per page', 'CSS Request Validator')   3Config.define('MAX_CSS_KB_PER_PAGE_AFTER_GZIP', 46,   Y              'Maximum size of stylesheets per page after gzip', 'CSS Request Validator')       ;# Reference data retrieved from HTTP Archive in 06-jan-2014   -Config.define('MAX_JS_REQUESTS_PER_PAGE', 17,   T              'Maximum number of external scripts per page', 'JS Request Validator')   3Config.define('MAX_JS_KB_PER_PAGE_AFTER_GZIP', 272,   T              'Maximum size of scripts per page after gzip', 'JS Request Validator')       #Config.define('MAX_TITLE_SIZE', 70,   U              'Title tags longer than 70 characters may be truncated in the results',                  'Title Validator')   2Config.define('METATAG_DESCRIPTION_MAX_SIZE', 300,   a              'Description Meta tags longer than 300 characters may be truncated in the results',   "              'Metatag validator')   1Config.define('MAX_HEADING_HIEARARCHY_SIZE', 150,   b              'Heading Hierarchy tags longer than 150 characters may be truncated in the results',   ,              'Heading Hierarchy Validator')   'Config.define('MAX_IMAGE_ALT_SIZE', 70,   _              'Image alt attributes longer than 70 characters may be truncated in the results',   .              'Image Alt Attribute Validator')       OConfig.define('ORIGIN', '*', 'Access Control Allow Origin header value', 'Web')       GConfig.define('HTTP_PROXY_HOST', None, 'HTTP Proxy Host to use', 'Web')   GConfig.define('HTTP_PROXY_PORT', None, 'HTTP Proxy Port to use', 'Web')       \Config.define('API_PROXY_HOST', None, 'HTTP Proxy Host to use to connect to the API', 'Web')   \Config.define('API_PROXY_PORT', None, 'HTTP Proxy Port to use to connect to the API', 'Web')       KConfig.define('COMMIT_ON_REQUEST_END', True, 'Commit on request end', 'DB')       >Config.define('REDISHOST', 'localhost', 'Redis host', 'Redis')   7Config.define('REDISPORT', 7575, 'Redis port', 'Redis')   KConfig.define('REDISPASS', None, 'Redis password in case of auth', 'Redis')       EConfig.define('MATERIAL_GIRL_REDISPORT', 7575, 'Redis port', 'Redis')   LConfig.define('MATERIAL_GIRL_REDISHOST', 'localhost', 'Redis host', 'Redis')   YConfig.define('MATERIAL_GIRL_REDISPASS', None, 'Redis password in case of auth', 'Redis')       [Config.define('REQUIRED_META_TAGS', [], 'List of required meta tags', 'Meta tag Validator')       ^Config.define('SCHEMA_ORG_ITEMTYPE', [], 'List of Schema.Org ItemType', 'Schema.Org ItemType')       MConfig.define('FORCE_CANONICAL', False, 'Force canonical', 'Force canonical')       MConfig.define('BLACKLIST_DOMAIN', [], 'Domain blacklist', 'Domain blacklist')       RConfig.define('ERROR_HANDLERS', [], 'List of classes to handle errors', 'General')       �Config.define('SEARCH_PROVIDER', 'holmes.search_providers.noexternal.NoExternalSearchProvider', 'Class to handle searching', 'Models')       pConfig.define('ELASTIC_SEARCH_PROTOCOL', 'http', 'ElasticSearch protocol (http|https)', 'ElasticSearchProvider')   `Config.define('ELASTIC_SEARCH_HOST', 'localhost', 'ElasticSearch host', 'ElasticSearchProvider')   YConfig.define('ELASTIC_SEARCH_PORT', 9200, 'ElasticSearch port', 'ElasticSearchProvider')   dConfig.define('ELASTIC_SEARCH_INDEX', 'holmes', 'ElasticSearch index name', 'ElasticSearchProvider')       # SENTRY ERROR HANDLER   ]Config.define('USE_SENTRY', False, 'If set to true errors will be sent to sentry.', 'Sentry')   JConfig.define('SENTRY_DSN_URL', '', 'URL to use as sentry DSN.', 'Sentry')       {Config.define('PAGE_COUNT_EXPIRATION_IN_SECONDS', HOUR, 'Expiration for the cache key for each domain page count', 'Cache')   �Config.define('VIOLATION_COUNT_EXPIRATION_IN_SECONDS', HOUR, 'Expiration for the cache key for each domain violation count', 'Cache')   �Config.define('ACTIVE_REVIEW_COUNT_EXPIRATION_IN_SECONDS', HOUR, 'Expiration for the cache key for each domain violation count', 'Cache')   �Config.define('RESPONSE_TIME_AVG_EXPIRATION_IN_SECONDS', HOUR, 'Expiration for the cache key for each domain average response time', 'Cache')   �Config.define('VIOLATIONS_BY_CATEGORY_EXPIRATION_IN_SECONDS', 6 * 60, 'Expiration for the cache key for each domain violation count by category', 'Cache')   �Config.define('TOP_CATEGORY_VIOLATIONS_EXPIRATION_IN_SECONDS', 6 * 60, 'Expiration for the cache key for each domain top violation in a category', 'Cache')   �Config.define('TOP_CATEGORY_VIOLATIONS_LIMIT', 10, 'Limit for the size of the list of top vilations of a key category for a domain', 'Domain Handler')   hConfig.define('URL_LOCK_EXPIRATION_IN_SECONDS', 30, 'Expiration for the url lock for each url', 'Cache')   vConfig.define('NEXT_JOB_URL_LOCK_EXPIRATION_IN_SECONDS', 3 * 60, 'Expiration for the url lock for next jobs', 'Cache')   yConfig.define('NEXT_JOBS_COUNT_EXPIRATION_IN_SECONDS', HOUR, 'Expiration for the cache key for next jobs count', 'Cache')       #materials_expiration_in_seconds = {   (    'domains_details': 0.5 * MINUTE + 1,   ?    'violation_count_by_category_for_domains': 3 * MINUTE + 11,   .    'blacklist_domain_count': 10 * MINUTE + 1,   '    'most_common_violations': HOUR + 7,   (    'failed_responses_count': HOUR + 13,   }   {Config.define('MATERIALS_EXPIRATION_IN_SECONDS', materials_expiration_in_seconds, 'Expire times for materials', 'material')       %materials_grace_period_in_seconds = {   N    'domains_details': 2 * materials_expiration_in_seconds['domains_details'],   ~    'violation_count_by_category_for_domains': 2 * materials_expiration_in_seconds['violation_count_by_category_for_domains'],   \    'blacklist_domain_count': 2 * materials_expiration_in_seconds['blacklist_domain_count'],   \    'most_common_violations': 2 * materials_expiration_in_seconds['most_common_violations'],   \    'failed_responses_count': 2 * materials_expiration_in_seconds['failed_responses_count'],   }   �Config.define('MATERIALS_GRACE_PERIOD_IN_SECONDS', materials_grace_period_in_seconds, 'Grace period times for materials', 'material')       oConfig.define('DEFAULT_PAGE_SCORE', 1, 'Page Score for pages that the user includes through the UI', 'General')   [Config.define('PAGE_SCORE_TAX_RATE', 0.1, 'Default tax rate for scoring pages.', 'General')   MConfig.define('MAX_PAGE_SCORE', 15000000, 'Maximum score of page', 'General')       |Config.define('REQUEST_CACHE_EXPIRATION_IN_SECONDS', HOUR, 'Expiration in seconds for cache storage of responses.', 'Cache')       <Config.define('MAX_URL_LEVELS', 20, 'Maximum levels of URL')       ;Config.define('GOOGLE_CLIENT_ID', None, 'Google client ID')       YConfig.define('LIMITER_LOCKS_EXPIRATION', 120, 'The expiration for locks in the limiter')   `Config.define('LIMITER_VALUES_CACHE_EXPIRATION', 600, 'The expiration for valus in the limiter')   sConfig.define('DEFAULT_NUMBER_OF_CONCURRENT_CONNECTIONS', 5, 'Default number of concurrent connections', 'Limiter')       �Config.define('MOST_COMMON_VIOLATIONS_CACHE_EXPIRATION', 3 * HOUR, 'Expiration for the cache key for the most common violations', 'Cache')   �Config.define('MOST_COMMON_VIOLATIONS_SAMPLE_LIMIT', 50000, 'Limit for the size of the Vilation sample used in the aggregation', 'Violation Handler')       throttling_message_type = {       'new-request': 5,       'new-page': 2,       'new-review': 2,   }   uConfig.define('EVENT_BUS_THROTTLING_MESSAGE_TYPE', throttling_message_type, 'Trottling by message type', 'Event Bus')       gConfig.define('SQLALCHEMY_AUTO_FLUSH', True, 'Defines whether auto-flush should be used in sqlalchemy')5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             S�&�     �                �             5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             S�&�     �             5�_�   	              
   
        ����                                                                                                                                                                                                                                                                                                                                                             S�&�    �   	   
          #5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'     �                I#Config.define('WORKER_SLEEP_TIME', 10, 'Main loop sleep time', 'Worker')5�_�                           ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 HConfig.define('WORKER_SLEEP_TIME', 10, 'Main loop sleep time', 'Worker')5�_�                           ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 7Config.define('', 10, 'Main loop sleep time', 'Worker')5�_�                           ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 CConfig.define('ANGULAR_ROOT', 10, 'Main loop sleep time', 'Worker')5�_�                           ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 AConfig.define('ANGULAR_ROOT', , 'Main loop sleep time', 'Worker')5�_�                          ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 EConfig.define('ANGULAR_ROOT', None, 'Main loop sleep time', 'Worker')5�_�                           ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 AConfig.define('ANGULAR_ROOT', , 'Main loop sleep time', 'Worker')5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 HConfig.define('ANGULAR_ROOT', './web', 'Main loop sleep time', 'Worker')5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 CConfig.define('ANGULAR_ROOT', './web', 'loop sleep time', 'Worker')5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 >Config.define('ANGULAR_ROOT', './web', 'sleep time', 'Worker')5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 8Config.define('ANGULAR_ROOT', './web', 'time', 'Worker')5�_�                       (    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 4Config.define('ANGULAR_ROOT', './web', '', 'Worker')5�_�                       5    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 EConfig.define('ANGULAR_ROOT', './web', 'Angular root path', 'Worker')5�_�                       =    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 IConfig.define('ANGULAR_ROOT', './web', 'Angular root app path', 'Worker')5�_�                       B    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                 JConfig.define('ANGULAR_ROOT', './web', 'Angular root app path.', 'Worker')5�_�                        B    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�    �                 DConfig.define('ANGULAR_ROOT', './web', 'Angular root app path.', '')5�_�                      %    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                @Config.define('ANGULAR_ROOT', None, 'loop sleep time', 'Worker')5�_�                        %    ����                                                                                                                                                                                                                                                                                                                                       	   ;       v���    S�'�     �                ;Config.define('ANGULAR_ROOT', None, 'sleep time', 'Worker')5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S��     �      �        5��