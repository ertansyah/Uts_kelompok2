import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({
    super.key, 
    required this.user,
    });
  final User user;

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _profilfotoController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isVisiblepassword = false;

  @override
  void initState() {
    if(widget.user.name != ""){
      _nameController.text = widget.user.name;
      _usernameController.text = widget.user.username;
      _emailController.text = widget.user.email;
      _profilfotoController.text = widget.user.profilePhoto!;
      _phoneController.text = widget.user.phoneNumber!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _profilfotoController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         SizedBox(
            height : MediaQuery.of(context).padding.top,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
            GestureDetector(
              onTap: (){
                GoRouter.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withAlpha(100),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.chevron_left_rounded,
                ), 
              ),
            ),
              const SizedBox(
                width: 8,
              ),
              const Text("Profile Detail",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ), 
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
           child: Form(
            key: _formkey,
             child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Nama"),
                      hintText: "ex: Diar Nurrizky",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "Nama Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
                
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("UserName"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "UserName Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !isVisiblepassword,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isVisiblepassword = !isVisiblepassword;
                          });
                        }, 
                        icon: Icon(
                          isVisiblepassword == false?
                          Icons.visibility_off_rounded:Icons.visibility
                          ),
                        ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "Password Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "Email Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _profilfotoController,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Photo Profil"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "Foto profil Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
                 const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      isDense: true,
                      label: const Text("Phone Number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                          ),
                      ),
                    ),
                    validator: (value){
                      if(value == "" || value == null){
                        return "Phone Number Wajihb Diisi";
                      }
                      return null;
                    },
                  ),
                ),
              ],
                     ),
           ),
          ),
          GestureDetector(
            onTap: (){
              if(_formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Column(
                    children: const  [
                      
                      Text("SUKSES",),
                      Text("Anda telah berhasil merubah data diri anda",),
                    ],
                  ),
                  )
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16,
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "SIMPAN",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}