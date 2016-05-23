Vim�UnDo� �I�>F�[��[(�N��{R8<�B�h	'�.� ��   �                                  S���    _�                     ~        ����                                                                                                                                                                                                                                                                                                                            0   !       0   =       v   =    S���     �               �   #!/usr/bin/python   # -*- coding: utf-8 -*-       !from tornado.gen import coroutine        from holmes.models import Domain   'from holmes.handlers import BaseHandler           "class DomainsHandler(BaseHandler):           @coroutine       def get(self):   I        domains = self.db.query(Domain).order_by(Domain.name.asc()).all()               if not domains:               self.write("[]")               return               result = []               for domain in domains:               result.append({                    "id": domain.id,   "                "url": domain.url,   $                "name": domain.name,   -                "is_active": domain.is_active               })               self.write_json(result)           *class DomainsFullDataHandler(BaseHandler):           @coroutine       def get(self):   1        result = self.girl.get('domains_details')           self.write_json(result)           (class DomainDetailsHandler(BaseHandler):           @coroutine       def get(self, domain_name):   @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   M            self.set_status(404, self._('Domain %s not found') % domain_name)               return       1        result = self.girl.get('domains_details')   J        data = next((l for l in result if l['name'] == domain_name), None)               if not data:   M            self.set_status(404, self._('Domain %s not found') % domain_name)               return       -        page_count = data.get('pageCount', 0)   1        review_count = data.get('reviewCount', 0)   7        violation_count = data.get('violationCount', 0)   9        error_percentage = data.get('errorPercentage', 0)   >        response_time_avg = data.get('averageResponseTime', 0)   ;        review_percentage = data.get('reviewPercentage', 0)               domain_json = {               "id": domain.id,                "name": domain.name,               "url": domain.url,   $            "pageCount": page_count,   (            "reviewCount": review_count,   .            "violationCount": violation_count,   2            "reviewPercentage": review_percentage,   *            "is_active": domain.is_active,   0            "errorPercentage": error_percentage,   5            "averageResponseTime": response_time_avg,               "homepageId": "",   #            "homepageReviewId": "",   	        }       /        homepage = domain.get_homepage(self.db)               if homepage:               if homepage.uuid:   >                domain_json["homepageId"] = str(homepage.uuid)   )            if homepage.last_review_uuid:   P                domain_json["homepageReviewId"] = str(homepage.last_review_uuid)       $        self.write_json(domain_json)           1class DomainViolationsPerDayHandler(BaseHandler):           def get(self, domain_name):   @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   E            self.set_status(404, 'Domain %s not found' % domain_name)               return       C        violations_per_day = domain.get_violations_per_day(self.db)               domain_json = {               "id": domain.id,                "name": domain.name,               "url": domain.url,   ,            "violations": violations_per_day   	        }       $        self.write_json(domain_json)           (class DomainReviewsHandler(BaseHandler):           @coroutine       def get(self, domain_name):   .        term = self.get_argument('term', None)   @        current_page = int(self.get_argument('current_page', 1))   ;        page_size = int(self.get_argument('page_size', 10))       @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   E            self.set_status(404, 'Domain %s not found' % domain_name)               return       ,        reviews = domain.get_active_reviews(               self.db,   !            url_starts_with=term,   &            current_page=current_page,               page_size=page_size   	        )               if term:               review_count = None           else:   K            review_count = yield self.cache.get_active_review_count(domain)               result = {   )            'reviewsCount': review_count,               'pages': [],   	        }               for page in reviews:   $            result['pages'].append({                    "url": page.url,   '                "uuid": str(page.uuid),   8                "violationCount": page.violations_count,   5                "completedAt": page.last_review_date,   6                "reviewId": str(page.last_review_uuid)               })               self.write_json(result)           2class DomainGroupedViolationsHandler(BaseHandler):           @coroutine       def get(self, domain_name):   @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   E            self.set_status(404, 'Domain %s not found' % domain_name)               return       ?        violation_defs = self.application.violation_definitions       U        grouped_violations = self.girl.get('violation_count_by_category_for_domains')               total = 0           violations = []       :        for item in grouped_violations.get(domain.id, []):   m            key_name, key_category_id, count = item['key_name'], item['category_id'], item['violation_count']               violations.append({   .                'categoryId': key_category_id,   E                'categoryName': violation_defs[key_name]['category'],                   'count': count               })               total += count               result = {   "            "domainId": domain.id,   &            'domainName': domain.name,   $            'domainURL': domain.url,               'total': total,   $            'violations': violations   	        }               self.write_json(result)           6class DomainTopCategoryViolationsHandler(BaseHandler):           @coroutine   0    def get(self, domain_name, key_category_id):   @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   E            self.set_status(404, 'Domain %s not found' % domain_name)               return       ?        violation_defs = self.application.violation_definitions       I        top_violations = yield self.cache.get_top_in_category_for_domain(               domain,               key_category_id,   H            self.application.config.get('TOP_CATEGORY_VIOLATIONS_LIMIT')   	        )               violations = []   .        for key_name, count in top_violations:               violations.append({   ;                'title': violation_defs[key_name]['title'],                   'count': count,                    'key': key_name,               })               result = {   "            "domainId": domain.id,   &            'domainName': domain.name,   $            'domainURL': domain.url,   *            'categoryId': key_category_id,   $            'violations': violations   	        }               self.write_json(result)           .class DomainsChangeStatusHandler(BaseHandler):           @coroutine        def post(self, domain_name):   @        domain = Domain.get_domain_by_name(domain_name, self.db)               if not domain:   E            self.set_status(404, 'Domain %s not found' % domain_name)               return       /        domain.is_active = not domain.is_active                if not domain.is_active:   E            yield self.cache.delete_limit_usage_by_domain(domain.url)           @coroutine   #    def options(self, domain_name):   9        super(DomainsChangeStatusHandler, self).options()5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            1   !       1   K       v   K    S��B     �   /   0   �                  �   /   1   �                  self.write(5�_�                    0       ����                                                                                                                                                                                                                                                                                                                            1   !       1   K       v   K    S��L     �   0   1   �    �   /   1   �      B            self.write(self._('Domain %s not found') % domain_name5�_�                    0   B    ����                                                                                                                                                                                                                                                                                                                            1   !       1   K       v   K    S��L     �   /   1   �      C            self.write(self._('Domain %s not found') % domain_name)5�_�                     1   B    ����                                                                                                                                                                                                                                                                                                                            1   !       1   K       v   K    S��M    �   0   2          N            #self.set_status(404, self._('Domain %s not found') % domain_name)5��