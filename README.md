# as3proto-osx
------------

### protobuf for Actionscript 3 on OSX platform
该项目搭建了**AS3 protobuf**所需的 **MAC OSX** 运行环境以及**AS3**类库，整合了**Google [protobuf][1]**和**[protobuf-actionscript3][2]**第三方插件资源
[1]: http://code.google.com/p/protobuf/ "[v2.3.0] http://code.google.com/p/protobuf/"
[2]: http://code.google.com/p/protobuf-actionscript3/ "http://code.google.com/p/protobuf-actionscript3/"

### 使用方法
1. #####编译安装protoc命令行    
	在**Terminal**里面进入**sdk/project**目录，运行下面脚本
	```
	./configure
	
	make
	make check
	sudo make install
	```
	
2. #####检查protobuf是否安装成功
	在Terminal中输入，回车
	```
	protoc --help
	```
	
	检查一下帮助内容是否包含**--as3_out**选项
	```
    --as3_out=OUT_DIR           Generate ActionScript source file.
    --cpp_out=OUT_DIR           Generate C++ header and source.
    --java_out=OUT_DIR          Generate Java source file.
    --python_out=OUT_DIR        Generate Python source file.
	```
	
3. #####使用命令行生成AS3代码	
	```
	protoc --proto_path=proto --as3_out=output proto/hello.proto
	```
	
4. #####使用protobuf.sh快速代码生成
	使用文本编辑器打开**protobuf.sh**文件
	* 把**OUTPUT_DIR**设置成**AS3**保存目录，支持绝对目录、相对目录
	* 把**PROTO_DIR**设置成**\*.proto**文件存储目录   
	
	在**Terminal**里面进入**protobuf.sh**所在目录  
	
	**hell.proto**文件内容  
	```
	message HelloWorld{
	    optional int32 code = 1;
	    optional string name = 2;
	    optional Info info = 3;

	    message Info{
	        optional string version = 1;
	    }
	}
	```
	
	运行  
	
	```
	sh protobuf.sh
	
	- - - - - - - - - - - - -
	Type proto file name:
	hello

	-> proto/hello.proto
	- - - - -

	DONE! Press ENTER key to continue...

	```
	
	在**OUTPUT_DIR**目录里面就可以得到相应的AS3代码  
	
	**HelloWorld.as**代码内容  
	```actionscript
	// Generated by the protocol buffer compiler.  DO NOT EDIT!

	package  {

	  import com.google.protobuf.*;
	  import flash.utils.*;
	  import com.hurlant.math.BigInteger;
	  import Info;
	  public final class HelloWorld extends Message {
	    public function HelloWorld() {
	      registerField("code","",Descriptor.INT32,Descriptor.LABEL_OPTIONAL,1);
	      registerField("name","",Descriptor.STRING,Descriptor.LABEL_OPTIONAL,2);
	      registerField("info","Info",Descriptor.MESSAGE,Descriptor.LABEL_OPTIONAL,3);
	    }
	    // optional int32 code = 1;
	    public var code:int = 0;
    
	    // optional string name = 2;
	    public var name:String = "";
    
	    // optional .HelloWorld.Info info = 3;
	    public var info:Info = null;
    
  
	  }
	}	
	
	```
	
	**Info.as**代码内容  
	```actionscript
	// Generated by the protocol buffer compiler.  DO NOT EDIT!

	package  {

	  import com.google.protobuf.*;
	  import flash.utils.*;
	  import com.hurlant.math.BigInteger;
	  public final class Info extends Message {
	    public function Info() {
	      registerField("version","",Descriptor.STRING,Descriptor.LABEL_OPTIONAL,1);
	    }
	    // optional string version = 1;
	    public var version:String = "";
    
  
	  }
	}
	```
	