Vim�UnDo� 3�f���N��?D��q�`�Xͳ�o@�.                                     Sҽ�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             Sҷz    �                   http = $httpBackend;5�_�                            ����                                                                                                                                                                                                                                                                                                                                         /       v   /    Sҽ�     �                  'use strict'       'describe 'Controller: TeamListCtrl', ->          # load the controller's module     beforeEach module 'webApp'         TeamListCtrl = {}     scope = {}     http = null       .  # Initialize the controller and a mock scope   >  beforeEach inject ($controller, $rootScope, $httpBackend) ->       http = $httpBackend   *    http.whenGET(/views/).respond(200, '')   .    http.whenGET(/api\/team/).respond(200, """   �      [{"slug": "team-0", "id": "53c57a2082f9b40fbe89a72f", "name": "team 0"}, {"slug": "team-1", "id": "53c57a2082f9b40fbe89a731", "name": "team 1"}]       """)       scope = $rootScope.$new()   0    TeamListCtrl = $controller 'TeamListCtrl', {         $scope: scope       }       =  it 'should attach a list of awesomeThings to the scope', ->       teams = []       scope.$apply()       http.flush()   .    expect(scope.model.teams).to.have.length 25�_�                          ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             Sҷ�     �              5��