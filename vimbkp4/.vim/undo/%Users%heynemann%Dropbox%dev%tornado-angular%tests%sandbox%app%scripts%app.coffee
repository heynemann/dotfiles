Vim�UnDo� WU�z�!=�b'�Te2��7?
9�@��Y�                     "       "   "   "    S�/�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             S�,R     �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,S     �               �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 $		$locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 1               $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 0              $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 /             $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 .            $locationProvider.html5Mode(true);5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 -           $locationProvider.html5Mode(true);5�_�      
           	       
    ����                                                                                                                                                                                                                                                                                                                                                             S�,T     �                 ,          $locationProvider.html5Mode(true);5�_�   	              
       	    ����                                                                                                                                                                                                                                                                                                                                                             S�,U     �                 +         $locationProvider.html5Mode(true);5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             S�,U     �                 *        $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,U     �                 )       $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,U     �                 (      $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,U     �                 '     $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,V     �                 &    $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,V     �                 %   $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,V     �                 $  $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,W     �                 # $locationProvider.html5Mode(true);5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             S�,W     �                 "$locationProvider.html5Mode(true);5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             S�,Z     �                  �                5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             S�,[     �                 "$locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,\     �                 # $locationProvider.html5Mode(true);5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S�,^     �                     "$locationProvider.html5Mode(true);�                 $  $locationProvider.html5Mode(true);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S�,c     �                 &    $locationProvider.html5Mode(true);5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             S�,d     �                 %   $locationProvider.html5Mode(true);5�_�                           ����                                                                                                                                                                                                                                                                                                                                      	          v       S�,h    �      
          # @ngdoc overview    # @name sandboxApp    # @description    # # sandboxApp    #   " # Main module of the application.5�_�                            ����                                                                                                                                                                                                                                                                                                                                      	          v       S�,l     �               # @ngdoc overview5�_�                           ����                                                                                                                                                                                                                                                                                                                                      	          v       S�,m     �                 # @ngdoc overview5�_�                       &    ����                                                                                                                                                                                                                                                                                                                                      	          v       S�,p     �                 &    $locationProvider.html5Mode(true);5�_�                           ����                                                                                                                                                                                                                                                                                                                                      	          v       S�,r    �                 .config ($routeProvider) ->5�_�                            ����                                                                                                                                                                                                                                                                                                                                      	          v       S�.�     �                     .when '/',5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                      	          v       S�.�     �                     .when '/about',5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                      	          v       S�.�    �                       redirectTo: '/'5�_�   !               "           ����                                                                                                                                                                                                                                                                                                                                      	          v       S�/�     �                  'use strict'       ###*   # @ngdoc overview   # @name sandboxApp   # @description   # # sandboxApp   #   !# Main module of the application.   ###   angular     .module('sandboxApp', [       'ngAnimate',       'ngCookies',       'ngResource',       'ngRoute',       'ngSanitize',       'ngTouch'     ])   0  .config ($routeProvider, $locationProvider) ->       $routeProvider         .when '/web/',   &        templateUrl: 'views/main.html'           controller: 'MainCtrl'         .when '/web/about',   '        templateUrl: 'views/about.html'           controller: 'AboutCtrl'         .otherwise           redirectTo: '/web/'       %    $locationProvider.html5Mode(true)5��