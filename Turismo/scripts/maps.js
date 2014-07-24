function mapas(json) {          
          var map = new google.maps.Map(document.getElementById("map_canvas"),{
            center: new google.maps.LatLng(-3.99, -79.203),
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP    
          });
          for(var i in json) {
            var build = json[i].fields;
            var name = build.nombre;            
            var lat = build.lat;
            var long = build.long;
            var historia = build.historia;
            var data = "<b>Nombre:</>"+name+"<br><b>Latitud:</>"+lat+"<br><b>Longitud:</>"+long+"<br><b>Historia: </>"+ historia;
            var location = new google.maps.LatLng(lat,long);            
            addMarker(map, data, location)
          }         
        }
        
        function mapaMonumento(lat, long, name) {          
          var map = new google.maps.Map(document.getElementById("map_canvas"),{
            center: new google.maps.LatLng(lat, long),
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP    
          });          
          var data = "<b>Nombre:</>"+name+"<br><b>Latitud:</>"+lat+"<br><b>Longitud:</>"+long;
          var location = new google.maps.LatLng(lat,long);            
          addMarker(map, data, location)                   
        }
         
      function addMarker(map, contenido, location){        
        var marker = new google.maps.Marker({
            position: location,            
            map: map
          });    
        google.maps.event.addListener(marker,'click', function(){
          if(typeof infowindow != 'undefined') infowindow.close();          
          infowindow = new google.maps.InfoWindow({
            content: contenido           
          });
          infowindow.open(map,marker);          
        });        
      }
      
      function undef(x1){
                var y1 = '';
                if(typeof x1 == 'undefined'){                    
                    return 'desconocida';                    
                }
                else{
                    y1 = x1.value
                    y1 = y1.replace(/'/gi,"\\'");
                    y1 = y1.replace(/"/gi,'\\"');                    
                    return y1 
                }                
      }      