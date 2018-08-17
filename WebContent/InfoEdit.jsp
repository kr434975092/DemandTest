<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="Bean.Director"%>
<%@page import="Bean.Company"%>
<%@page import="Bean.Info"%>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
    function objInit(obj){
      return $(obj).html("<option value='请选择'>请选择</option>");
    }
    
    //只写了河北省一组
    var arrData={
      河北省:
      {
        石家庄市:'长安区,桥东区,桥西区,新华区,井陉矿区,裕华区,井陉县,正定县,栾城县,行唐县,灵寿县,高邑县,深泽县,赞皇县,无极县,平山县,元氏县,赵　县,辛集市,藁城市,晋州市,新乐市,鹿泉市',
        唐山市:'路南区,路北区,古冶区,开平区,丰南区,丰润区,滦　县,滦南县,乐亭县,迁西县,玉田县,唐海县,遵化市,迁安市',
        秦皇岛市:'海港区,山海关区,北戴河区,青龙满族自治县,昌黎县,抚宁县,卢龙县',
        邯郸市:'邯山区,丛台区,复兴区,峰峰矿区,邯郸县,临漳县,成安县,大名县,涉　县,磁　县,肥乡县,永年县,邱　县,鸡泽县,广平县,馆陶县,魏　县,曲周县,武安市',
        邢台市:'桥东区,桥西区,邢台县,临城县,内丘县,柏乡县,隆尧县,任　县,南和县,宁晋县,巨鹿县,新河县,广宗县,平乡县,威　县,清河县,临西县,南宫市,沙河市',
        保定市:'新市区,北市区,南市区,满城县,清苑县,涞水县,阜平县,徐水县,定兴县,唐　县,高阳县,容城县,涞源县,望都县,安新县,易　县,曲阳县,蠡　县,顺平县,博野县,雄　县,涿州市,定州市,安国市,高碑店市',
        张家口市:'桥东区,桥西区,宣化区,下花园区,宣化县,张北县,康保县,沽源县,尚义县,蔚　县,阳原县,怀安县,万全县,怀来县,涿鹿县,赤城县,崇礼县',
        承德市:'双桥区,双滦区,鹰手营子矿区,承德县,兴隆县,平泉县,滦平县,隆化县,丰宁满族自治县,宽城满族自治县,围场满族蒙古族自治县',
        沧州市:'新华区,运河区,沧　县,青　县,东光县,海兴县,盐山县,肃宁县,南皮县,吴桥县,献　县,孟村回族自治县,泊头市,任丘市,黄骅市,河间市',
        廊坊市:'安次区,广阳区,固安县,永清县,香河县,大城县,文安县,大厂回族自治县,霸州市,三河市',
        衡水市:'桃城区,枣强县,武邑县,武强县,饶阳县,安平县,故城县,景　县,阜城县,冀州市,深州市'
      }
    };
    
    var subjectArr = {
    		   哲学:
    		   {
    		        哲学:'哲学,逻辑学,宗教学,伦理学'
    		  },
    		  经济学:
    		  {
    		     经济学类:'经济学,经济统计学,国民经济管理,资源与环境经济学,商务经济学,金融工程',
    		     财政学类:'财政学,税收学,能源经济'  
    		  },
    		  法学:
    		  {
    		     法学类:'法学,知识产权,监狱学',
    		     社会学类:'社会学,社会工作,人类学,女性学'
    		  }
    		};
    
    var eiArr = {
    	    农、林、牧、渔:
    	   {
    	     农业:'谷物种植,豆类油料和薯类种植,棉、麻、糖、烟草种植,蔬菜、食用菌及园艺作物种植,水果种植,坚果、含油果、香料和饮料作物种植,中药材种植,草种植及割草',
    	    林业:'林木育种和育苗,造林和更新,森林经营、管护和改培,木材和竹材采运,林产品采集',
    	    畜牧业:'牲畜饲养,家禽饲养,狩猎和捕捉动物,其他畜牧业',
    	    渔业:'水产养殖,水产捕捞',
    	    农、林、牧、渔专业及辅助性活动:'农业专业及辅助性活动,林业专业及辅助性活动,畜牧专业及辅助性活动,渔业专业及辅助性活动'
    	   },
    	    采矿:
    	    {
    	     煤炭开采和洗选业:'烟煤和无烟煤开采洗选,褐煤开采洗选,其他煤炭采选',
    	     石油和天然气开采业:'石油开采,天然气开采',
    	     黑色金属矿采选业:'铁矿采选,锰矿、铬矿采选,其他黑色金属矿采选',
    	     有色金属矿采选业:'常用有色金属矿采选,贵金属矿采选,稀有稀土金属矿采选',
    	     非金属矿采选业:'土砂石开采,化学矿开采,采盐,石棉及其他非金属矿采选,煤炭开采和洗选专业及辅助性活动',
    	     开采专业及辅助性活动:'石油和天然气开采专业及辅助性活动,其他开采专业及辅助性活动',
    	     其他采矿业:'其他采矿业' 
    	    }
    	}
    
    
    var province = "${province}";
    var city = "${city}";
    var country = "${country}";

    var si1 = "${si[0]}";
	var si2 = "${si[1]}";
	var si3 = "${si[2]}";
	
	si1 = si1.split(" ");
	si2 = si2.split(" ");
	si3 = si3.split(" ");
	
	var ei1 = "${ei[0]}";
	var ei2 = "${ei[1]}";
	var ei3 = "${ei[2]}";
    
	ei1 = ei1.split(" ");
	ei2 = ei2.split(" ");
	ei3 = ei3.split(" ");
    
    $.each(arrData,function(pF){
       if(pF==province)$('#selF').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
       else $('#selF').append("<option value='"+pF+"'>"+pF+"</option>");
      });
    $.each(subjectArr,function(pF){
    	if(pF==si1[0])$('#su11').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#su11').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    $.each(subjectArr,function(pF){
    	if(pF==si2[0])$('#su21').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#su21').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    $.each(subjectArr,function(pF){
    	if(pF==si3[0])$('#su31').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#su31').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    $.each(eiArr,function(pF){
    	if(pF==ei1[0])$('#ei11').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#ei11').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    $.each(eiArr,function(pF){
    	if(pF==ei2[0])$('#ei21').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#ei21').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    $.each(eiArr,function(pF){
    	if(pF==ei3[0])$('#ei31').append("<option value='"+pF+"' selected>"+pF+"</option>");   //这里的Option没有value值,记得要改
        else $('#ei31').append("<option value='"+pF+"'>"+pF+"</option>");
    });
    
    //恢复保存的区域列表信息(三级联动下拉菜单)
    function init(province,city,country){
   	 	if(province!=null&&city!=null&&country!=null){
   	 	    objInit('#selT');  
            objInit('#selC');	
   	 		$.each(arrData,function(pF,pS){
   	 			if($("#selF option:selected").text()==pF){
   	 				$.each(pS,function(pT,pC){
   	 					if(pT==city){
   	 						$('#selT').append("<option value='"+pT+"' selected>"+pT+"</option>");
   	 						objInit('#selC');	
   	 						$.each(pS,function(pT,pC){
   	 							if($("#selT option:selected").text()==pT){
   	 								$.each(pC.split(","),function(){
   	 									if(this==country)$('#selC').append("<option value='"+this+"' selected>"+this+"</option>");
   	 									else $('#selC').append("<option value='"+this+"'>"+this+"</option>");
   	 								});
   	 							}
   	 						});
   	 					}
   	 					else $('#selT').append("<option value='"+pT+"'>"+pT+"</option>");
   	 				});
   	 			}
   	 		});
   	 	}
   	 	province = null;
   	 	city = null;
   	 	country = null;
    }
    function initSu(si1,si2,si3){
    	if(si1!=null){
    		 objInit('#su12');  
             objInit('#su13');	
    	 		$.each(subjectArr,function(pF,pS){
    	 			if($("#su11 option:selected").text()==pF){
    	 				$.each(pS,function(pT,pC){
    	 					if(pT==si1[1]){
    	 						$('#su12').append("<option value='"+pT+"' selected>"+pT+"</option>");
    	 						objInit('#su13');	
    	 						$.each(pS,function(pT,pC){
    	 							if($("#su12 option:selected").text()==pT){
    	 								$.each(pC.split(","),function(){
    	 									if(this==si1[2])$('#su13').append("<option value='"+this+"' selected>"+this+"</option>");
    	 									else $('#su13').append("<option value='"+this+"'>"+this+"</option>");
    	 								});
    	 							}
    	 						});
    	 					}
    	 					else $('#su12').append("<option value='"+pT+"'>"+pT+"</option>");
    	 				});
    	 			}
    	 		});
    	}
    	si1 = null;
    	if(si2!=null){
   		 objInit('#su22');  
            objInit('#su23');	
   	 		$.each(subjectArr,function(pF,pS){
   	 			if($("#su21 option:selected").text()==pF){
   	 				$.each(pS,function(pT,pC){
   	 					if(pT==si2[1]){
   	 						$('#su22').append("<option value='"+pT+"' selected>"+pT+"</option>");
   	 						objInit('#su23');	
   	 						$.each(pS,function(pT,pC){
   	 							if($("#su22 option:selected").text()==pT){
   	 								$.each(pC.split(","),function(){
   	 									if(this==si2[2])$('#su23').append("<option value='"+this+"' selected>"+this+"</option>");
   	 									else $('#su23').append("<option value='"+this+"'>"+this+"</option>");
   	 								});
   	 							}
   	 						});
   	 					}
   	 					else $('#su22').append("<option value='"+pT+"'>"+pT+"</option>");
   	 				});
   	 			}
   	 		});
   	}
   	si2 = null;
   	if(si3!=null){
  		 objInit('#su32');  
           objInit('#su33');	
  	 		$.each(subjectArr,function(pF,pS){
  	 			if($("#su31 option:selected").text()==pF){
  	 				$.each(pS,function(pT,pC){
  	 					if(pT==si3[1]){
  	 						$('#su32').append("<option value='"+pT+"' selected>"+pT+"</option>");
  	 						objInit('#su33');	
  	 						$.each(pS,function(pT,pC){
  	 							if($("#su32 option:selected").text()==pT){
  	 								$.each(pC.split(","),function(){
  	 									if(this==si3[2])$('#su33').append("<option value='"+this+"' selected>"+this+"</option>");
  	 									else $('#su33').append("<option value='"+this+"'>"+this+"</option>");
  	 								});
  	 							}
  	 						});
  	 					}
  	 					else $('#su32').append("<option value='"+pT+"'>"+pT+"</option>");
  	 				});
  	 			}
  	 		});
  	}
  	si3 = null;
    }
    function initEi(si1,si2,si3){
    	if(si1!=null){
    		 objInit('#ei12');  
             objInit('#ei13');	
    	 		$.each(eiArr,function(pF,pS){
    	 			if($("#ei11 option:selected").text()==pF){
    	 				$.each(pS,function(pT,pC){
    	 					if(pT==si1[1]){
    	 						$('#ei12').append("<option value='"+pT+"' selected>"+pT+"</option>");
    	 						objInit('#ei13');	
    	 						$.each(pS,function(pT,pC){
    	 							if($("#ei12 option:selected").text()==pT){
    	 								$.each(pC.split(","),function(){
    	 									if(this==si1[2])$('#ei13').append("<option value='"+this+"' selected>"+this+"</option>");
    	 									else $('#ei13').append("<option value='"+this+"'>"+this+"</option>");
    	 								});
    	 							}
    	 						});
    	 					}
    	 					else $('#ei12').append("<option value='"+pT+"'>"+pT+"</option>");
    	 				});
    	 			}
    	 		});
    	}
    	si1 = null;
    	if(si2!=null){
   		 objInit('#ei22');  
            objInit('#ei23');	
   	 		$.each(eiArr,function(pF,pS){
   	 			if($("#ei21 option:selected").text()==pF){
   	 				$.each(pS,function(pT,pC){
   	 					if(pT==si2[1]){
   	 						$('#ei22').append("<option value='"+pT+"' selected>"+pT+"</option>");
   	 						objInit('#ei23');	
   	 						$.each(pS,function(pT,pC){
   	 							if($("#ei22 option:selected").text()==pT){
   	 								$.each(pC.split(","),function(){
   	 									if(this==si2[2])$('#ei23').append("<option value='"+this+"' selected>"+this+"</option>");
   	 									else $('#ei23').append("<option value='"+this+"'>"+this+"</option>");
   	 								});
   	 							}
   	 						});
   	 					}
   	 					else $('#ei22').append("<option value='"+pT+"'>"+pT+"</option>");
   	 				});
   	 			}
   	 		});
   	}
   	si2 = null;
   	if(si3!=null){
  		 objInit('#ei32');  
           objInit('#ei33');	
  	 		$.each(eiArr,function(pF,pS){
  	 			if($("#ei31 option:selected").text()==pF){
  	 				$.each(pS,function(pT,pC){
  	 					if(pT==si3[1]){
  	 						$('#ei32').append("<option value='"+pT+"' selected>"+pT+"</option>");
  	 						objInit('#ei33');	
  	 						$.each(pS,function(pT,pC){
  	 							if($("#ei32 option:selected").text()==pT){
  	 								$.each(pC.split(","),function(){
  	 									if(this==si3[2])$('#ei33').append("<option value='"+this+"' selected>"+this+"</option>");
  	 									else $('#ei33').append("<option value='"+this+"'>"+this+"</option>");
  	 								});
  	 							}
  	 						});
  	 					}
  	 					else $('#su32').append("<option value='"+pT+"'>"+pT+"</option>");
  	 				});
  	 			}
  	 		});
  	}
  	si3 = null;
    }
       init(province,city,country);
       initSu(si1,si2,si3);
       initEi(ei1,ei2,ei3);
    //构建所在区域的三级联动菜单
      $('#selF').change(function(){
        objInit('#selT');  
        objInit('#selC');	
        $.each(arrData,function(pF,pS){
          if($('#selF option:selected').text()==pF){
            $.each(pS,function(pT,pC){

           		$('#selT').append("<option value='"+pT+"'>"+pT+"</option>");
            });
            $('#selT').change(function(){
              objInit('#selC');
              $.each(pS,function(pT,pC){
                if($('#selT option:selected').text()==pT){
                  $.each(pC.split(","),function(){
             		$('#selC').append("<option value='"+this+"'>"+this+"</option>");
                  })
                }
              })
            });
          }
        })
      });
      $('#selT').change(function(){
    	  objInit('#selC');
    	  $.each(arrData,function(pF,pS){
    		  if($('#selF option:selected').text()==pF){
    			  $.each(pS,function(pT,pC){
    				  if($('#selT option:selected').text()==pT){
    					  $.each(pC.split(","),function(){
    		             		$('#selC').append("<option value='"+this+"'>"+this+"</option>");
    		              });
    				  }
    			  });
    		  }
    	  });
      });
      //三级学科1
      $('#su11').change(function(){
          objInit('#su12');  
          objInit('#su13');	
          $.each(subjectArr,function(pF,pS){
            if($('#su11 option:selected').text()==pF){
              $.each(pS,function(pT,pC){

             		$('#su12').append("<option value='"+pT+"'>"+pT+"</option>");
              });
              $('#su12').change(function(){
                objInit('#su13');
                $.each(pS,function(pT,pC){
                  if($('#su12 option:selected').text()==pT){
                    $.each(pC.split(","),function(){
               		$('#su13').append("<option value='"+this+"'>"+this+"</option>");
                    })
                  }
                })
              });
            }
          })
        });
        $('#su12').change(function(){
      	  objInit('#su13');
      	  $.each(subjectArr,function(pF,pS){
      		  if($('#su11 option:selected').text()==pF){
      			  $.each(pS,function(pT,pC){
      				  if($('#su12 option:selected').text()==pT){
      					  $.each(pC.split(","),function(){
      		             		$('#su13').append("<option value='"+this+"'>"+this+"</option>");
      		              });
      				  }
      			  });
      		  }
      	  });
        });
        //三级学科2
        $('#su21').change(function(){
            objInit('#su22');  
            objInit('#su23');	
            $.each(subjectArr,function(pF,pS){
              if($('#su21 option:selected').text()==pF){
                $.each(pS,function(pT,pC){

               		$('#su22').append("<option value='"+pT+"'>"+pT+"</option>");
                });
                $('#su22').change(function(){
                  objInit('#su23');
                  $.each(pS,function(pT,pC){
                    if($('#su22 option:selected').text()==pT){
                      $.each(pC.split(","),function(){
                 		$('#su23').append("<option value='"+this+"'>"+this+"</option>");
                      })
                    }
                  })
                });
              }
            })
          });
          $('#su22').change(function(){
        	  objInit('#su23');
        	  $.each(subjectArr,function(pF,pS){
        		  if($('#su21 option:selected').text()==pF){
        			  $.each(pS,function(pT,pC){
        				  if($('#su22 option:selected').text()==pT){
        					  $.each(pC.split(","),function(){
        		             		$('#su23').append("<option value='"+this+"'>"+this+"</option>");
        		              });
        				  }
        			  });
        		  }
        	  });
          });
          
          //三级学科3
          $('#su31').change(function(){
              objInit('#su32');  
              objInit('#su33');	
              $.each(subjectArr,function(pF,pS){
                if($('#su31 option:selected').text()==pF){
                  $.each(pS,function(pT,pC){

                 		$('#su32').append("<option value='"+pT+"'>"+pT+"</option>");
                  });
                  $('#su32').change(function(){
                    objInit('#su33');
                    $.each(pS,function(pT,pC){
                      if($('#su32 option:selected').text()==pT){
                        $.each(pC.split(","),function(){
                   		$('#su33').append("<option value='"+this+"'>"+this+"</option>");
                        })
                      }
                    })
                  });
                }
              })
            });
            $('#su32').change(function(){
          	  objInit('#su33');
          	  $.each(subjectArr,function(pF,pS){
          		  if($('#su31 option:selected').text()==pF){
          			  $.each(pS,function(pT,pC){
          				  if($('#su32 option:selected').text()==pT){
          					  $.each(pC.split(","),function(){
          		             		$('#su33').append("<option value='"+this+"'>"+this+"</option>");
          		              });
          				  }
          			  });
          		  }
          	  });
            });
          //行业1
            $('#ei11').change(function(){
                objInit('#ei12');  
                objInit('#ei13');	
                $.each(eiArr,function(pF,pS){
                  if($('#ei11 option:selected').text()==pF){
                    $.each(pS,function(pT,pC){

                   		$('#ei12').append("<option value='"+pT+"'>"+pT+"</option>");
                    });
                    $('#ei12').change(function(){
                      objInit('#ei13');
                      $.each(pS,function(pT,pC){
                        if($('#ei12 option:selected').text()==pT){
                          $.each(pC.split(","),function(){
                     		$('#ei13').append("<option value='"+this+"'>"+this+"</option>");
                          })
                        }
                      })
                    });
                  }
                })
              });
              $('#ei12').change(function(){
            	  objInit('#ei13');
            	  $.each(eiArr,function(pF,pS){
            		  if($('#ei11 option:selected').text()==pF){
            			  $.each(pS,function(pT,pC){
            				  if($('#ei12 option:selected').text()==pT){
            					  $.each(pC.split(","),function(){
            		             		$('#ei13').append("<option value='"+this+"'>"+this+"</option>");
            		              });
            				  }
            			  });
            		  }
            	  });
              });
              //三级学科2
              $('#ei21').change(function(){
                  objInit('#ei22');  
                  objInit('#ei23');	
                  $.each(eiArr,function(pF,pS){
                    if($('#ei21 option:selected').text()==pF){
                      $.each(pS,function(pT,pC){

                     		$('#ei22').append("<option value='"+pT+"'>"+pT+"</option>");
                      });
                      $('#ei22').change(function(){
                        objInit('#ei23');
                        $.each(pS,function(pT,pC){
                          if($('#ei22 option:selected').text()==pT){
                            $.each(pC.split(","),function(){
                       		$('#ei23').append("<option value='"+this+"'>"+this+"</option>");
                            })
                          }
                        })
                      });
                    }
                  })
                });
                $('#ei22').change(function(){
              	  objInit('#ei23');
              	  $.each(eiArr,function(pF,pS){
              		  if($('#ei21 option:selected').text()==pF){
              			  $.each(pS,function(pT,pC){
              				  if($('#ei22 option:selected').text()==pT){
              					  $.each(pC.split(","),function(){
              		             		$('#ei23').append("<option value='"+this+"'>"+this+"</option>");
              		              });
              				  }
              			  });
              		  }
              	  });
                });
                
                //三级学科3
                $('#ei31').change(function(){
                    objInit('#su32');  
                    objInit('#su33');	
                    $.each(eiArr,function(pF,pS){
                      if($('#ei31 option:selected').text()==pF){
                        $.each(pS,function(pT,pC){

                       		$('#ei32').append("<option value='"+pT+"'>"+pT+"</option>");
                        });
                        $('#ei32').change(function(){
                          objInit('#ei33');
                          $.each(pS,function(pT,pC){
                            if($('#ei32 option:selected').text()==pT){
                              $.each(pC.split(","),function(){
                         		$('#ei33').append("<option value='"+this+"'>"+this+"</option>");
                              })
                            }
                          })
                        });
                      }
                    })
                  });
                  $('#ei32').change(function(){
                	  objInit('#ei33');
                	  $.each(eiArr,function(pF,pS){
                		  if($('#ei31 option:selected').text()==pF){
                			  $.each(pS,function(pT,pC){
                				  if($('#ei32 option:selected').text()==pT){
                					  $.each(pC.split(","),function(){
                		             		$('#ei33').append("<option value='"+this+"'>"+this+"</option>");
                		              });
                				  }
                			  });
                		  }
                	  });
                  });
    });
$(document).ready(function(){
	function checkNum(num,str){
		if(str.length!=num)return false;
		for(i = 0;i<str.length;i++){
			if(!(str[i]>='0'&&str[i]<='9'))return false;
		}
		return true;
	}
	
	for(i = 1961;i<=1980;i++){
		$("select[name='dyear']").append("<option value='"+i+"'>"+i+"</option>");
	}
	
	$(".addC").click(function(){
		var num = $("#ccc").children("input").length;  //#ccc是添加元素的父控件
		var t = $("#ccc").find("input:last").val();
		if(num<5 ){ 
			$("#ccc").append("<br/><input type='text' name='gc' placeholder='填写单位名称'/><span class='del'>删除该单位</span>");
		}
	});
	
	//为动态加载的元素绑定函数
	$("#ccc").on("click",".del",function(){
		var num = $("#ccc").children("input").length;
		if(num==1)$("#ccc").find("input:last").val("");
		if(num>1){
			$(this).prev("input").remove();
			$(this).remove();
		}
	})
	
	$(".del").click(function(){
		var num = $("#ccc").children("input").length;
		if(num==1)$("#ccc").find("input:last").val("");
		if(num>1){
			$(this).prev("input").remove();
			$(this).remove();
		}
		
	});
	//判断法人资格
	$("input[name='cls']").click(function(){
		var a = $("input[name='cls']:checked").val();
		if($.trim(a)=="独立法人")$(".cls1").show();
		else $(".cls1").hide();
	});
	//判断。。。隐藏一个显示另一个
	$("input[name='kind']").click(function(){
		var a = $("input[name='kind']:checked").val();
		if($.trim(a)=="多单位联合共建"){
			$(".kind2").show();
			$(".kind1").hide();
		}else{
			$(".kind1").show();
			$(".kind2").hide();
		}
	});
	var flag = 1;
	
	//失去焦点时判断内容是否填写并提示
	
	$("input[name='wh']").blur(function(){
		var wh = $(this).val();
		if(wh==""){
			$("#whp").html("请填写批准文号");
			flag = 0;
		}else{
			$("#whp").html("");
			flag = 1;
		}
	});
	$("#selF").blur(function(){
		var f = $("#selF option:selected").val();
		if(f=="请选择"||t=="请选择"||c=="请选择"){
			$("#prop").html("请完整填写行政区划");
			flag = 0;
		}else{
			$("#prop").html("");
			flag = 1;
		}
	});
	$("#selT").blur(function(){
		var t = $("#selT option:selected").val();
		if(t=="请选择"){
			$("#prop").html("请完整填写行政区划");
			flag = 0;
		}else{
			$("#prop").html("");
			flag = 1;
		}
	});
	$("#selC").blur(function(){
		var c = $("#selC option:selected").val();
		if(c=="请选择"){
			$("#prop").html("请完整填写行政区划");
			flag = 0;
		}else{
			$("#prop").html("");
			flag = 1;
		}
	});
	//cname clr code ctel
	$("input[name='cname']").blur(function(){
		var cname = $(this).val();
		if(cname==""){
			$("#cnp").html("请填写依托单位名称");
			flag = 0;
		}else{
			$("#cnp").html("");
			flag = 1;
		}
	});
	$("input[name='clr']").blur(function(){
		var clr = $(this).val();
		if(clr==""){
			$("#clrp").html("请填写法人代表姓名");
			flag = 0;
		}else{
			$("#clrp").html("");
			flag = 1;
		}
	});
	$("input[name='code']").blur(function(){
		var code = $(this).val();
		if(code==""){
			$("#ccp").html("请填写社会信用代码");
			flag = 0;
		}else{
			$("#ccp").html("");
			flag = 1;
		}
	});
	$("input[name='ctel']").blur(function(){
		var ctel = $(this).val();
		if(ctel==""||ctel.indexOf('-')==-1){
			$("#ctelp").html("请正确填写联系电话");
			flag = 0;
		}else{
			$("#ctelp").html("");
			flag = 1;
		}
	});
	$("input[name='dname']").blur(function(){
		var dname = $(this).val();
		if(dname==""){
			$("#dn").html("请填写主任姓名");
			flag = 0;
		}else{
			$("#dn").html("");
			flag = 1;
		}
	});
	$("input[name='majoy']").blur(function(){
		var majoy = $(this).val();
		if(majoy==""){
			$("#dm").html("请填写学科");
			flag = 0;
		}else{
			$("#dm").html("");
			flag = 1;
		}
	});
	$("input[name='email']").blur(function(){
		var email = $(this).val();
		if(email==""){
			$("#dem").html("请填写邮箱");
			flag = 0;
		}
		else if(email.indexOf('@')==-1||email.indexOf(".com")==-1){
			$("#dem").html("请按正确格式填写邮箱");
			flag = 0;
		}else{
			$("#dem").html("");
			flag = 1;
		}
	});
	$("input[name='telephone']").blur(function(){
		var dtel = $(this).val();
		if(dtel==""||dtel.indexOf('-')==-1){
			$("#dtel").html("请正确填写办公电话");
			flag = 0;
		}else{
			$("#dtel").html("");
			flag = 1;
		}
	});
	$("input[name='phone']").blur(function(){
		var dp = $(this).val();
		if(dp==""){
			$("#dp").html("请填写学科");
			flag = 0;
		}else{
			$("#dp").html("");
			flag = 1;
		}
	});
	$("input[name='web']").blur(function(){
		var web = $(this).val();
		if(web==""){
			$("#web").html("请填写网站名称");
			flag = 0;
		}else{
			$("#web").html("");
			flag = 1;
		}
	});
	$("input[name='url']").blur(function(){
		var url = $(this).val();
		if(url==""){
			$("#url").html("请填写网址");
			flag = 0;
		}else{
			$("#url").html("");
			flag = 1;
		}
	});
	$("input[name='p']").blur(function(){
		var p = $(this).val();
		if(p==""){
			$("#pp").html("请填写地址");
			flag = 0;
		}else{
			$("#pp").html("");
			flag = 1;
		}
	});
	$("input[name='e']").blur(function(){
		var e = $(this).val();
		if(e==""){
			$("#pe").html("请填写邮编");
			flag = 0;
		}else{
			$("#pe").html("");
			flag = 1;
		}
	});

	//完整提交时再次检验
	
	$("input[value='确认提交']").click(function(){
		var flag1 = 1;
		var wh = $("input[name='wh']").val();
		if(wh==""){
			$("#whp").html("请填写批准文号");
			flag1 = 0;
		}
		var self = $("#selF option:selected").val();
		var selt = $("#selT option:selected").val();
		var selc = $("#selC option:selected").val();
		if(self=="请选择"||selt=="请选择"||selc=="请选择"){
			$("#prop").html("请填写行政区划");
			flag1 = 0;
		}
		var si11 = $("#su11 option:selected").val();
		var si12 = $("#su12 option:selected").val();
		var si13 = $("#su13 option:selected").val();
		if(si11=="请选择"||si12=="请选择"||si13=="请选择"){
			$("#su1").html("请填写行业!");
			flag1 = 0;
		}
		var si21 = $("#su21 option:selected").val();
		var si22 = $("#su22 option:selected").val();
		var si23 = $("#su23 option:selected").val();
		if(si21=="请选择"||si22=="请选择"||si23=="请选择"){
			$("#su2").html("请填写行业!");
			flag1 = 0;
		}
		var si31 = $("#su31 option:selected").val();
		var si32 = $("#su32 option:selected").val();
		var si33 = $("#su33 option:selected").val();
		if(si31=="请选择"||si32=="请选择"||si33=="请选择"){
			$("#su3").html("请填写行业!");
			flag1 = 0;
		}
		
		var ei11 = $("#ei11 option:selected").val();
		var ei12 = $("#ei12 option:selected").val();
		var ei13 = $("#ei13 option:selected").val();
		if(ei11=="请选择"||ei12=="请选择"||ei13=="请选择"){
			$("#ei1").html("请填写行业!");
			flag1 = 0;
		}
		var ei21 = $("#ei21 option:selected").val();
		var ei22 = $("#ei22 option:selected").val();
		var ei23 = $("#ei23 option:selected").val();
		if(ei21=="请选择"||ei22=="请选择"||ei23=="请选择"){
			$("#ei2").html("请填写行业!");
			flag1 = 0;
		}
		var ei31 = $("#ei31 option:selected").val();
		var ei32 = $("#ei32 option:selected").val();
		var ei33 = $("#ei33 option:selected").val();
		if(ei31=="请选择"||ei32=="请选择"||ei33=="请选择"){
			$("#ei3").html("请填写行业!");
			flag1 = 0;
		}
		
		if($(".kind2").is(":hidden")){
			var cname = $("input[name='cname']").val();
			var clr = $("input[name='clr']").val();
			var code = $("input[name='code']").val();
			var ctel = $("input[name='ctel']").val();
			if(cname==""){
				$("#cnp").html("请填写依托单位名称");
				flag1 = 0;
			}
			if(clr==""){
				$("#clrp").html("请填写法人代表姓名");
				flag1 = 0;
			}
			if(code==""){
				$("#ccp").html("请填写社会信用代码");
				flag1 = 0;
			}
			if(ctel==""||ctel.indexOf('-')==-1){
				$("#ctelp").html("请正确填写联系电话");
				flag1 = 0;
			}
		}
		if($(".kind1").is(":hidden")){
			var last = $("#ccc").find("input:last").val();
			if(last==""){
				$("#k2p").html("请完整填写共建单位名称");
				flag1 = 0;
			}
		}
		var dname = $("input[name='dname']").val();
		if(dname==""){
			$("#dn").html("请填写主任姓名");
			flag1 = 0;
		}
		var majoy = $("input[name='majoy']").val();
		if(majoy==""){
			$("#dm").html("请填写学科专业");
			flag1 = 0;
		}
		var majoy = $("input[name='email']").val();
		if(majoy==""||majoy.indexOf('@')==-1||majoy.indexOf('.com')==-1){
			$("#dem").html("请正确填写email");
			flag1 = 0;
		}
		var telephone = $("input[name='telephone']").val();
		if(telephone==""||telephone.indexOf('-')==-1){
			$("#dtel").html("请填写办公电话");
			flag1 = 0;
		}
		var phone = $("input[name='phone']").val();
		if(phone==""||!checkNum(11,phone)){
			$("#dp").html("请正确填写手机号");
			flag1 = 0;
		}
		var web = $("input[name='web']").val();
		if(web==""){
			$("#web").html("请填写网站名称");
			flag1 = 0;
		}
		var url = $("input[name='url']").val();
		if(url==""){
			$("#url").html("请填写网站网址");
			flag1 = 0;
		}
		var p = $("input[name='p']").val();
		if(p==""){
			$("#pp").html("请填写具体位置");
			flag1 = 0;
		}
		var e = $("input[name='e']").val();
		if(e==""||!checkNum(6,e)){
			$("#pe").html("请正确填写邮编");
			flag1 = 0;
		}
		if(flag1==0)return false;
		else{
			$("#ccc").find("input").prop("disabled",false);
			return true;
		}

		
	});
	
	//这个没什么用了不用管他
	$("input[value='暂时保存']").click(function(){
		$("#ccc").find("input").prop("disabled",false);
	});
});

</script>

<script type="text/javascript">
//为部分保存的值(主要是针对下拉菜单和单选按钮)恢复
$(function(){
	var level = "${info.level}";
	if(level!=null&&level!="")$("input[name='level'][value='"+level+"']").prop("checked","checked");
	var jj = "${info.jj}";
	if(jj!=null&&jj!="")$("input[name='jj'][value='"+jj+"']").prop("checked","checked");
	var kind = "${info.kind}";
	
	if(kind!=null&&kind!=""){
		$("input[name='kind'][value='"+kind+"']").prop("checked","checked");
		if(kind=="多单位联合共建"){
			$(".kind2").show();
			$(".kind1").hide();
	    for(i = 0;i<5;++i){
	    	if(i==0){
				var ci = "${ci[0]}";
				if(ci!=null&&ci!="")$("input[name='gc']").val(ci);
			}
			if(i==1){
				var ci = "${ci[1]}";
				if(ci!=null&&ci!=""){
					$("#ccc").append("<br/><input type='text' name='gc' placeholder='填写单位名称' value='"+ci+"'/><span class='del'>删除该单位</span>");
				}
			}
			if(i==2){
				var ci = "${ci[2]}";
				if(ci!=null&&ci!=""){
					$("#ccc").append("<br/><input type='text' name='gc' placeholder='填写单位名称' value='"+ci+"'/><span class='del'>删除该单位</span>");
				}
			}
			if(i==3){
				var ci = "${ci[3]}";
				if(ci!=null&&ci!=""){
					$("#ccc").append("<br/><input type='text' name='gc' placeholder='填写单位名称' value='"+ci+"'/><span class='del'>删除该单位</span>");
				}
			}
			if(i==4){
				var ci = "${ci[4]}";
				if(ci!=null&&ci!=""){
					$("#ccc").append("<br/><input type='text' name='gc' placeholder='填写单位名称' value='"+ci+"'/><span class='del'>删除该单位</span>");
				}
			}	
			
			
		}
			
		}
		if(kind=="依托单位独自建设"){
			$(".kind1").show();
			$(".kind2").hide();
		}
	}
	var year = "${info.year}";
	var month = "${info.month}";
	if(year!=0&&month!=0){
		$("select[name='year']").find("option[value='"+year+"']").attr("selected","selected");
		$("select[name='month']").find("option[value='"+month+"']").attr("selected","selected");
	}
	var cls = "${info.cls}";
	if(cls!=""&&cls!=null){
		if(cls=="无法人资格")$("input[name='cls'][value='"+cls+"']").prop("checked","checked");
		else{
			$("input[name='cls'][value='独立法人']").prop("checked","checked");
			$(".cls1").show();
			$("input[name='cls1'][value='"+cls+"']").prop("checked","checked");
		}
	}
	
	var ckind = "${company.kind}";
	if(ckind!=null&&ckind!="")$("input[name='ckind'][value='"+ckind+"']").prop("checked","checked");
	
	var degree = "${director.degree}";
	if(degree!=null&&degree!="")$("select[name='degree']").find("option[value='"+degree+"']").attr("selected","selected");
	var dtitle = "${director.title}";
	if(dtitle!=null&&dtitle!="")$("select[name='dtitle']").find("option[value='"+dtitle+"']").attr("selected","selected");
	var drecord = "${director.record}";
	if(drecord!=null&&drecord!="")$("select[name='drecord']").find("option[value='"+drecord+"']").attr("selected","selected");
	var dsex = "${director.sex}";
	if(dsex!=null&&dsex!="")$("select[name='dsex']").find("option[value='"+dsex+"']").attr("selected","selected");
	var dyear = "${director.year}";
	if(dyear!=0)$("select[name='dyear']").find("option[value='"+dyear+"']").attr("selected","selected");
	var dmonth = "${director.month}";
	if(dmonth!=0)$("select[name='dmonth']").find("option[value='"+dmonth+"']").attr("selected","selected");
	
	
});
</script>
<style>
.tat{
	text-align:center;
	
}
#selF,#selT,#selC{
	width:100px;
}
.addC{
	cursor:pointer;
	color:red;
	margin:0px;
	color:red;
	font-size:12px;
	font-family:微软雅黑;
}
.cls1{
	display:none;
	background:#dcddc0 url('img/cell-grey.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
}
.kind2{
	display:none;
}
.del{
	cursor:pointer;
	color:red;
	margin:0px;
	color:red;
	font-size:12px;
	font-family:微软雅黑;
}
.editp{
	margin:0px;
	color:red;
	font-size:12px;
	font-family:微软雅黑;
}
.bz{
	margin:0px;
	font-size:12px;
	font-family:微软雅黑;
}
table.table{
    width:100%;
    text-align:center;
	font-family:微软雅黑;
	font-size:20px;
	color:black;
	border-width:1px;
	border-color:#999999;
	border-collapse:collapse;
}
th{
	background:#b5cfd2 url('img/cell-blue.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
}
td.td{
	background:#dcddc0 url('img/cell-grey.jpg');
	border-width:1px;
	border-style:solid;
	border-color:#99999;
}
.button{
	width:100px;
	height:30px;
	color:black;
	font-size:20px;
	background-color:white;
	border:1px solid black;
	margin-top:5px;
	margin-bottom:5px;
}
.button:hover{
	color:blue;
	cursor:pointer;
}
</style>
<title>基本信息采集</title>
</head>
<body>
<form action="ms" method="post">
<table border="1" class="table">
<tr><td colspan="3">创新平台基本信息表</td></tr>
<tr><th>平台名称:${currentname}</th><th>平台编号:${currentid}</th><th>技术领域:${info.field}</th></tr>
<tr><td class="td">批准年月:
	<select name="year">
	 <option value="2016" selected>2016年</option>
	 <option value="2017">2017年</option>
	 <option value="2018">2018年</option>
	</select>
	<select name="month">
	<option value="1" selected>1月</option>
	<option value="2">2月</option>
	<option value="3">3月</option>
	<option value="4">4月</option>
	<option value="5">5月</option>
	<option value="6">6月</option>
	<option value="7">7月</option>
	<option value="8">8月</option>
	<option value="9">9月</option>
	<option value="10">10月</option>
	<option value="11">11月</option>
	<option value="12">12月</option>
	</select><br />
	<p class="editp" id="ym"></p>
</td><td class="td">批准文号:<input type="text" name="wh" placeholder="注意格式" value="${info.ig}"/><br/><p class="editp" id="whp"></p></td><td class="td"></td></tr>
<tr><td class="td">平台级别:<input type="radio" name="level" value="国家级" checked/>国家级<input type="radio" name="level" value="省级"/>省级<br/></td><td colspan="2" class="td">所属市县:
<select name="province" id="selF"><option value="请选择">请选择</option></select>
<select name="city" id="selT"><option value="请选择">请选择</option></select>
<select name="country" id="selC"><option value="请选择">请选择</option></select>
<br/>
<p class="editp" id="prop"></p>
</td></tr>
<tr>
<th rowspan="2">平台组织形态:</th>

<td class="td">京津冀共建:
<input type="radio" name="jj" value="是" />是
<input type="radio" name="jj" value="否" checked />否
</td>
<td class="td">
<input type="radio" name="cls" value="无法人资格" checked />无法人资格
<input type="radio" name="cls" value="独立法人"/>独立法人
</td>
</tr>
<tr>
<td class="td">
<input type="radio" name="kind" value="多单位联合共建" />多单位联合共建
<input type="radio" name="kind" value="依托单位独自建设" checked />依托单位独自建设
</td>
<td class="cls1">
<input type="radio" name="cls1" value="企业法人" />企业法人
<input type="radio" name="cls1" value="事业法人" checked />事业法人
<input type="radio" name="cls1" value="社团法人" />社团法人
</td>
</tr>
<tr class="kind1">
<td class="td">依托单位名称:<input type="text" name="cname" placeholder="填写单位名称" value="${company.name}"/><br/><p class="editp" id="cnp"></p></td>
<td class="td">依托单位法人:<input type="text" name="clr" placeholder="法人代表姓名" value="${company.clr}"/><br/><p class="editp" id="clrp"></p></td><td class="td"></td></tr>
<tr class="kind1"><td class="td">社会信用代码:<input type="text" name="code" placeholder="依托单位组织机构代码" value="${company.code}"/><br/><p class="editp" id="ccp"></p></td>
<td class="td">办公电话:<input type="text" name="ctel" placeholder="填写依托单位办公电话" value="${company.phone}"/><br/><p class="editp" id="ctelp"></p></td><td class="td"></td>
</tr>
<tr class="kind1">
<th colspan="3">依托单位类型:
<input type="radio" name="ckind" value="企业" />企业
<input type="radio" name="ckind" value="科研机构" />科研机构
<input type="radio" name="ckind" value="高等院校" />高等院校
<input type="radio" name="ckind" value="检测机构" />检测机构
<input type="radio" name="ckind" value="医疗机构" />医疗机构   
<input type="radio" name="ckind" value="政府机构" />政府机构
<input type="radio" name="ckind" value="社团院校" />社团院校
<input type="radio" name="ckind" value="其他" checked/>其他
</th>
</tr>
<tr class="kind2">
<th>共建单位名称
<p class="bz">(必填,<span class="addC">增加单位</span>)</p><p id=""></p></th><td id="ccc" colspan="2" class="td"><input type="text" name="gc" placeholder="填写单位名称"/><span class="del">删除该单位</span></td>
</tr>

<tr>
<th rowspan="3">
所属的主要学科
<p class="bz">(必填)</p>
</th>
<td colspan="2" class="td">
<select style="width:100px;" name="一级学科1" id="su11">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="二级学科1" id="su12">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="三级学科1" id="su13">
<option value="请选择" selected>请选择</option>
</select>
<p class="editp" id="su1"></p>
</td>
</tr>
<tr>
<td colspan="2" class="td">
<select style="width:100px;" name="一级学科2" id="su21">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="二级学科2" id="su22">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="三级学科2" id="su23">
<option value="请选择" selected>请选择</option>
</select>
<p class="editp" id="su2"></p>
</td></tr>
<tr><td colspan="2" class="td">
<select style="width:100px;" name="一级学科3" id="su31">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="二级学科3" id="su32">
<option value="请选择" selected>请选择</option>
</select>
<select style="width:100px;" name="三级学科3" id="su33">
<option value="请选择" selected>请选择</option>
</select>
<p class="editp" id="su3"></p>
</td></tr>

<tr>
<th rowspan="3">
服务的主要国民经济行业
<p class="bz">(必填)</p>
</th>
<td colspan="2" class="td">
<select style="width:100px;" name="行业11" id="ei11">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业21" id="ei12">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业31" id="ei13">
<option value="请选择">请选择</option>
</select>
<p class="editp" id="ei1"></p>
</td>
</tr>
<tr>
<td colspan="2" class="td">
<select style="width:100px;" name="行业12" id="ei21">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业22" id="ei22">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业32" id="ei23">
<option value="请选择">请选择</option>
</select>
<p class="editp" id="ei2"></p>
</td></tr>
<tr><td colspan="2" class="td">
<select style="width:100px;" name="行业13" id="ei31">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业23" id="ei32">
<option value="请选择">请选择</option>
</select>
<select style="width:100px;" name="行业33" id="ei33">
<option value="请选择">请选择</option>
</select>
<p class="editp" id="ei3"></p>
</td></tr>
<tr>
<th rowspan="5">
平台主任(院长)
</th>
<td class="td">姓名:<input type="text" name="dname" placeholder="填写姓名" value="${director.name}"/><br/>
<p class="editp" id="dn"></p>
</td>
<td class="td">性别:<input type="radio" name="dsex" checked value="男" />男
<input type="radio" name="dsex" value="女" />女
</tr>
<tr><td class="td">出生年月:
<select name="dyear">
	 <option value="1960" selected>1960</option>
</select>
<select name="dmonth">
	<option value="1" selected>1月</option>
	<option value="2">2月</option>
	<option value="3">3月</option>
	<option value="4">4月</option>
	<option value="5">5月</option>
	<option value="6">6月</option>
	<option value="7">7月</option>
	<option value="8">8月</option>
	<option value="9">9月</option>
	<option value="10">10月</option>
	<option value="11">11月</option>
	<option value="12">12月</option>
</select>
</td>
<td class="td">职称:
<select name="dtitle">
<option value="教授" selected>教授</option>
<option value="副教授">副教授</option>
<option value="讲师">讲师</option>
<option value="工程师">工程师</option>
</select></td>
</tr>
<tr>
<td class="td">学历:
<select name="drecord">
<option value="专科" selected>专科</option>
<option value="本科">本科</option>
<option value="硕士研究生">硕士研究生</option>
<option value="博士研究生">博士研究生</option>
</select>
</td>
<td class="td">
学位:
<select name="degree">
<option value="学士" selected>学士</option>
<option value="硕士">硕士</option>
<option value="博士">博士</option>
</select>
</td>
</tr>
<tr><td class="td">
所学专业:<input type="text" name="majoy" placeholder="所学专业" value="${director.majoy }"/>
<br/><p class="editp" id="dm"></p>
</td>
<td class="td">邮箱:<input type="text" name="email" placeholder="邮箱" value="${director.email }" />
<br/><p class="editp" id="dem"></p></td>
</tr>
<tr>
<td class="td">办公电话:<input type="text" name="telephone" placeholder="办公电话"  value="${director.telephone }"/><br/><p class="editp" id="dtel"></p></td>
<td class="td">手机号:<input type="text" name="phone" placeholder="手机号"  value="${director.phone }"/><br/><p class="editp" id="dp"></p></td>
</tr>
<tr>
<td class="td">平台网站名称:<input type="text" name="web" placeholder="网站名称"  value="${info.web }"/><br/><p class="editp" id="web"></p></td>
<td class="td">网址:<input type="text" name="url" placeholder="网址"  value="${info.url }"/><br/><p  class="editp" id="url"></p></td>
<td class="td"><input type="submit" name="sb" class="button" value="确认提交" /></td>
</tr>
<tr><td class="td">平台通讯地址:<input type="text" name="p" placeholder="填写平台所在的具体位置" value="${info.p }"/><br/><p class="editp" id="pp"></p></td>
<td class="td">邮编:<input type="text" name="e" placeholder="填写正确的邮编"  value="${info.e }"/><br/><p class="editp" id="pe"></p></td>
<td class="td"><input type="submit" name="sb" class="button" value="暂时保存" /></td>
</tr>
</table>
</form>
</body>
</html>
