Vim�UnDo� ��j|�}�;B�a���4����J<� �-�                    M   M   M   M   L    Sp�U    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Sp�_     �                errorClass = 'has-error'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Sp�_     �                successClass = 'has-success'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Sp�_     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�a     �         O      class NewTeamCtrl5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�a     �         O      class 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                        @selectedMembers = []5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                        @nameAvailable = null5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                         @nameAvailableClass = ''5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                        @user =5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                            name: "heynemann"5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                K            picture: 'http://graph.facebook.com/bernardo.heynemann/picture'5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�h     �                ?        @scope.$watch('model.teamName', (newValue, oldValue) =>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�i     �                '            @validateTeamName(newValue)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�i     �                	        )5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Sp�i     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sp�j     �                $        @teamOwner = @auth.getUser()5�_�                            ����                                                                                                                                                                                                                                                                                                                                       ?          v���    Sp�o     �         C   <            getUsersThatMatch: (name) ->   |        promise = @http({method: 'GET', url: "http://local.featness.com:8000/users/find?name=#{ name }"}).then((response) ->                return response.data   	        )           return promise           validateTeamName: (name) ->   "        if not name? or name == ''   !            @nameAvailable = null   $            @nameAvailableClass = ''               return       e        @http({method: 'GET', url: "http://local.featness.com:8000/teams/available?name=#{ name }"}).   6            success((data, status, headers, config) =>   9                if data? and data.toLowerCase() == "true"   )                    @nameAvailable = true   6                    @nameAvailableClass = successClass                   else   *                    @nameAvailable = false   4                    @nameAvailableClass = errorClass               ).   4            error((data, status, headers, config) =>   &                @nameAvailable = false   0                @nameAvailableClass = errorClass               )           addMember: () =>            member = @selectedMember   j        memberAlreadyAdded = @selectedMembers.indexOf(member) != -1 or member.UserId == @teamOwner.account           @selectedMember = null   $        return if memberAlreadyAdded       %        @selectedMembers.push(member)           removeMember: (member) =>   0        index = @selectedMembers.indexOf(member)           return if index == -1       )        @selectedMembers.splice(index, 1)           createTeam: =>           formData =               name: @teamName   %            owner: @teamOwner.account   =            users: (user.UserId for user in @selectedMembers)               @http(   <            url: "http://local.featness.com:8000/teams/new",               method: "POST",   J            headers: {'Content-Type': 'application/x-www-form-urlencoded'}   #            data: $.param(formData)   4        ).success((data, status, headers, config) =>   /            @location.url("/team/#{ data[0] }")   2        ).error((data, status, headers, config) =>   &            # TODO: Show error message   	        )               return false    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�t     �               I    .controller 'NewTeamCtrl', ($scope, $http, $location, AuthService) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�t     �               H    .controller 'ewTeamCtrl', ($scope, $http, $location, AuthService) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�t     �               G    .controller 'wTeamCtrl', ($scope, $http, $location, AuthService) ->5�_�                          ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�w     �               F    .controller 'TeamCtrl', ($scope, $http, $location, AuthService) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�y     �                 M        $scope.model = new NewTeamCtrl($scope, $http, $location, AuthService)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�z     �                 L        $scope.model = new ewTeamCtrl($scope, $http, $location, AuthService)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�z     �                 K        $scope.model = new wTeamCtrl($scope, $http, $location, AuthService)5�_�                       '    ����                                                                                                                                                                                                                                                                                                                                                 v���    Spր     �               J    .controller 'ShowTeamCtrl', ($scope, $http, $location, AuthService) ->5�_�                       .    ����                                                                                                                                                                                                                                                                                                                                                 v���    Spւ     �                 N        $scope.model = new ShowTeamCtrl($scope, $http, $location, AuthService)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Spֆ    �               5    constructor: (@scope, @http, @location, @auth) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �         	              �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �         	              @teamId = 5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �                        @teamId = teamId5�_�       #           !          ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �                   constructor: (@scope) ->5�_�   !   $   "       #      '    ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �               +    .controller 'ShowTeamCtrl', ($scope) ->5�_�   #   %           $      (    ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�      �               -    .controller 'ShowTeamCtrl', ($scope, ) ->�             5�_�   $   &           %      4    ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�     �      	   	              �      	       5�_�   %   '           &   	   .    ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�    �                 /        $scope.model = new ShowTeamCtrl($scope)5�_�   &   (           '   	   0    ����                                                                                                                                                                                                                                                                                                                            	   0       	   5       v   5    Sp�     �                 7        $scope.model = new ShowTeamCtrl($scope, teamId)5�_�   '   )           (   	   '    ����                                                                                                                                                                                                                                                                                                                            	   0       	   5       v   5    Sp�     �                 1        $scope.model = new ShowTeamCtrl($scope, )�   	            5�_�   (   *           )   	   .    ����                                                                                                                                                                                                                                                                                                                            	   0       	   5       v   5    Sp�     �                 7        $scope.model = new ShowTeamCtrl(teamId$scope, )5�_�   )   +           *   	   6    ����                                                                                                                                                                                                                                                                                                                            	   0       	   5       v   5    Sp�     �                 9        $scope.model = new ShowTeamCtrl(teamId, $scope, )5�_�   *   ,           +   	   6    ����                                                                                                                                                                                                                                                                                                                            	   0       	   5       v   5    Sp�     �                 8        $scope.model = new ShowTeamCtrl(teamId, $scope )5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                 v        Sp�     �         	      %    constructor: (@scope, @teamId) ->5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                 v        Sp�     �         	          constructor: (@scope, ) ->�         	    5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                 v        Sp�     �         	      %    constructor: (@teamId@scope, ) ->5�_�   .   0           /      !    ����                                                                                                                                                                                                                                                                                                                                                 v        Sp�     �         	      '    constructor: (@teamId, @scope, ) ->5�_�   /   1           0      !    ����                                                                                                                                                                                                                                                                                                                                                 v        Sp�    �         	      &    constructor: (@teamId, @scope ) ->5�_�   0   2           1          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�M    �         	      class ShowTeamCtrl�         	    5�_�   1   4           2   	       ����                                                                                                                                                                                                                                                                                                                                                v       Sp׈    �      
          7        $scope.model = new ShowTeamCtrl(teamId, $scope)5�_�   2   5   3       4   	       ����                                                                                                                                                                                                                                                                                                                                                v       Sp��    �      
          8        #$scope.model = new ShowTeamCtrl(teamId, $scope)5�_�   4   6           5      5    ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �         	      9    .controller 'ShowTeamCtrl', ($scope, $routeParams) ->5�_�   5   7           6   	   6    ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �                 7        $scope.model = new ShowTeamCtrl(teamId, $scope)5�_�   6   8           7      !    ����                                                                                                                                                                                                                                                                                                                                                v       Sp��   	 �         	      %    constructor: (@teamId, @scope) ->5�_�   7   9           8      '    ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �         	    5�_�   8   :           9           ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �         
       �         
    5�_�   9   ;           :          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �                   loadUserTeams: ->5�_�   :   <           ;          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �                   load: ->5�_�   ;   =           <          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �             5�_�   <   >           =          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �                       �             5�_�   =   ?           >          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��     �                       @loadTeamData5�_�   >   @           ?      H    ����                                                                                                                                                                                                                                                                                                                                                v       Sp�   
 �      	         L        @http({method: 'GET', url: "http://local.featness.com:8000/teams"}).5�_�   ?   A           @      G    ����                                                                                                                                                                                                                                                                                                                                                v       Sp�:     �      	         Y        @http({method: 'GET', url: "http://local.featness.com:8000/teams/#{ @teamId }"}).5�_�   @   C           A   
       ����                                                                                                                                                                                                                                                                                                                                                v       Sp�;     �   	   
                           @allTeams = data5�_�   A   D   B       C   
       ����                                                                                                                                                                                                                                                                                                                                                v       Sp�=     �   	   
          #                @loadSelectedTeam()5�_�   C   E           D   	       ����                                                                                                                                                                                                                                                                                                                                                v       Sp�>     �   	                            �   	          5�_�   D   F           E      $    ����                                                                                                                                                                                                                                                                                                                                                v       Sp�D     �             �             5�_�   E   G           F          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�J     �               %                console.log arguments5�_�   F   H           G          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�M    �                                @allTeams = []5�_�   G   I           H           ����                                                                                                                                                                                                                                                                                                                                                v       Sp�O     �                 5�_�   H   J           I           ����                                                                                                                                                                                                                                                                                                                                                v       Sp�O    �                 5�_�   I   K           J   	        ����                                                                                                                                                                                                                                                                                                                                                v       Sp�A     �   	                            �   	          5�_�   J   L           K          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�G     �   
             %                console.log arguments5�_�   K   M           L          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�N    �                               �             5�_�   L               M          ����                                                                                                                                                                                                                                                                                                                                                v       Sp�U    �              5�_�   A           C   B   	       ����                                                                                                                                                                                                                                                                                                                                                v       Sp�<     �              5�_�   2           4   3          ����                                                                                                                                                                                                                                                                                                                                                v       Sp��    �      	   	      %        @teamId = $routeParams.teamId5�_�   !           #   "           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp��     �               -    .controller 'ShowTeamCtrl', , ($scope) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v���    Sp�u     �                5��