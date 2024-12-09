package cs
import cjglfw.*
import std.collection.*
struct rgb {
    public init(ra:Float32,ga:Float32,ba:Float32)
    {
        this.r=ra
        this.g=ga
        this.b=ba
    }
    var r:Float32=0.0
    var g:Float32=0.0
    var b:Float32=0.0
}
main(): Int64 {
    var window=ArrayList<UIntNative>([0,0,0,0])
   var gl=glfw()
   var open=opengl()
   println("glfw初始化")
   var a=gl.csh()
    gl.WindowHint(GLFW_DECORATED,GLFW_FALSE)
   
   let out=gl.GetMonitorWorkarea(gl.GetPrimaryMonitor())   
   var rgbsz:Array<rgb>=[
       rgb(0.95f32, 0.32f32, 0.11f32),
       rgb(0.5f32, 0.8f32, 0.16f32),
       rgb(0.0f32, 0.68f32, 0.994f32),
       rgb(0.98f32, 0.74f32, 0.04f32) 
   ]

   for(i in 0..4)
   {
    var s=out[3]/5

    if(i>0)
    {
        gl.WindowHint(GLFW_FOCUS_ON_SHOW, GLFW_FALSE)
    }
   
    gl.WindowHint(GLFW_POSITION_X, out[0] + s *(1 + (i & 1)))
    gl.WindowHint(GLFW_POSITION_Y, out[1] + s * (1 + (i >> 1)))
    
    window[i]=gl.CreateWindow(s,s,"Multi-Window Example",0,0)
    
    gl.SetInputMode(window[i], GLFW_STICKY_KEYS, GLFW_TRUE)
    gl.MakeContextCurrent(window[i])
    open.csh(gl.GetProcAddress)
    open.ClearColor(rgbsz[i].r,rgbsz[i].g,rgbsz[i].b,1.0f32)
    }

       while (true) 
       {
        println("检查点")
        for(i in 0..4)
        {
            
            gl.MakeContextCurrent(window[i])
            open.Clear(open.GL_COLOR_BUFFER_BIT)
            gl.SwapBuffers(window[i])
            if(gl.WindowShouldClose(window[i])==1) 
            {
                gl.Terminate()
            }
            if(gl.GetKey(window[i],GLFW_KEY_ESCAPE)==1)
            {
                gl.Terminate()
            }
             gl.WaitEvents()
        }
        
       } 

       
    
   

    return 0
}