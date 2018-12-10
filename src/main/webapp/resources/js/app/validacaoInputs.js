//function verificarCPdF(c){
//    var i;
//    s = c;
//    
//    exp = /\.|\-/g;
//        cpf = cpf.toString().replace(exp, ""); 
//    
//    
//    var c = s.substr(0,9);
//    var dv = s.substr(9,2);
//    var d1 = 0;
//    var v = false;
// 
//    for (i = 0; i < 9; i++){
//        d1 += c.charAt(i)*(10-i);
//    }
//    if (d1 == 0){
//    	swal("CPF Invalido!", "CPF Invalido! Digite novamente por gentileza.", "error");
//        v = true;
//        return false;
//    }
//    d1 = 11 - (d1 % 11);
//    if (d1 > 9) d1 = 0;
//    if (dv.charAt(0) != d1){
//    	swal("CPF Invalido!", "CPF Invalido! Digite novamente por gentileza.", "error");
//        v = true;
//        return false;
//    }
// 
//    d1 *= 2;
//    for (i = 0; i < 9; i++){
//        d1 += c.charAt(i)*(11-i);
//    }
//    d1 = 11 - (d1 % 11);
//    if (d1 > 9) d1 = 0;
//    if (dv.charAt(1) != d1){
//    	swal("CPF Invalido!", "CPF Invalido! Digite novamente por gentileza.", "error");
//        v = true;
//        return false;
//    }
//    if (!v) {
//    	swal("CPF Invalido!", c + "nCPF Invalido! Digite novamente por gentileza.", "error");
//    }
//}

//valida o CPF digitado
//function verificarCPF(Objcpf){
//        var cpf = Objcpf.value;
//        exp = /\.|\-/g;
//        cpf = cpf.toString().replace(exp, ""); 
//        var digitoDigitado = eval(cpf.charAt(9)+cpf.charAt(10));
//        var soma1=0, soma2=0;
//        var vlr =11;
//
//        for(i=0;i<9;i++){
//                soma1+=eval(cpf.charAt(i)*(vlr-1));
//                soma2+=eval(cpf.charAt(i)*vlr);
//                vlr--;
//        }       
//        soma1 = (((soma1*10)%11)==10 ? 0:((soma1*10)%11));
//        soma2=(((soma2+(2*soma1))*10)%11);
//
//        var digitoGerado=(soma1*10)+soma2;
//        if(digitoGerado!=digitoDigitado)        
//                alert('CPF Invalido!');         
//}