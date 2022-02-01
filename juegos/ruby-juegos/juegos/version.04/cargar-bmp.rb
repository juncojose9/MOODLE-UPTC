require 'sdl.rb'

  SDL.init(SDL::INIT_VIDEO)
  SDL::WM.setCaption("SDL-Cargar BMP", "")
 
  #sdlVideoFlags |= SDL::FULLSCREEN
  pantalla = SDL.set_video_mode(640, 480, 16,  SDL::DOUBLEBUF)
 
  #SDL::Mouse.hide
  pantalla.fillRect(0, 0, 640, 480, pantalla.mapRGB(200, 200, 200))

  #imagen=SDL.getVideoSurface()
  #imagen=pantalla.load_bmp("juegos/iconos/info.bmp")
  #SDL::BlitSurface(icono,nil,$pantalla,nil)
  imagen = SDL::Surface.loadBMP("juegos/iconos/applications-office.bmp")
  imagen.setColorKey( SDL::SRCCOLORKEY ,[255,255,255])
  imagen = imagen.displayFormat
  SDL.blitSurface(imagen,0,0,imagen.w,imagen.h,pantalla,100,100)
 
  print "SDL::VERSION   = ",SDL::VERSION,"\n"
  print "SDL::DOUBLEBUF = ",SDL::DOUBLEBUF,"\n"
  #print "SDL::DOUBLEBUF = ",SDL::BYTEORDER,"\n"
  vi = SDL.video_info
  #puts vi.vfmt.BitsPerPixel
  puts vi
  #puts SDL::BYTEORDER
  
  # actualizamos toda la pantalla
  pantalla.updateRect(0, 0, 0, 0)
  
  while true
  while event = SDL::Event2.poll
    case event
    when SDL::Event2::KeyDown, SDL::Event2::Quit
      exit
    end
  end
  sleep 0.2
end

  