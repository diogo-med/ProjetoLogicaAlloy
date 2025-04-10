module projetoLogica

sig Organizacao {}

sig Usuario {
  organizacao : lone Organizacao,  // Cada usuário tem uma ou nenhum organização
  acessos : set Repositorio      // Repositórios que o usuário pode acessar
}

sig Desenvolvedor extends Usuario { // Usuário que mexe no repositório
    trabalhos : set Repositorio
} 

sig Repositorio {
  organizacao : one Organizacao,  // Cada repositório pertence a uma única organização
}

pred mesmaOrg[u : Usuario, r : Repositorio]{
    u.organizacao = r.organizacao
}

fact RegrasUsuarios{
        //usuarios só acessam repositórios da mesma organizção
        all u : Usuario, r : Repositorio | r in u.acessos iff mesmaOrg[u, r]

       //usuário só acessa repositório se ele for contribuinte do repositório em questão
        all u : Usuario, r : Repositorio | (u in acessos.r) iff (r in u.acessos)

        //usuário pode não acessar repositórios
        //some u: Usuario | #u.acessos = 0
    }
 
fact RegrasDesenvolvedores{
        //Desenvolvedor precisa ter entre 1 e 5 trabalhos ativos
        all dev : Desenvolvedor | #dev.trabalhos > 0 and #dev.trabalhos <= 5

        //Os acessos do desenvolvedor devem ser os mesmos, ou maior, que a quantidade de repositórios que trabalha
        all dev : Desenvolvedor | #dev.acessos >= #dev.trabalhos

        //O desenvolvedor precisa ter acesso ao repositório que trabalha
        all dev : Desenvolvedor , r : Repositorio | r in dev.trabalhos implies r in dev.acessos

        //Os trabalhos do desenvolvedor devem estar na mesma organização do desenvolvedor
        all dev : Desenvolvedor, r : Repositorio | r in dev.trabalhos iff mesmaOrg[dev, r] 

        //Desenvolvedores só acessam repositórios da organização em que pertencem
        all dev : Desenvolvedor, r : Repositorio | r in dev.acessos iff mesmaOrg[dev, r]
    }

fact RegrasRepositorio{
        //repositório pode não ter usuários
        some r : Repositorio | #acessos.r = 0

         //repositório só tem usuários da mesma organização
        all u : Usuario, r : Repositorio | u in acessos.r iff mesmaOrg[u, r]
    }


run{
    #Organizacao = 2
} for 7

assert acessaRepositorioDaMesmaOrganizacao{
    all u : Usuario, r : Repositorio | r in u.acessos implies mesmaOrg[u, r]
}

check acessaRepositorioDaMesmaOrganizacao for 5

assert trabalhaEmRepositorioDaMesmaOrganização{
    all dev : Desenvolvedor, r : Repositorio | r in dev.trabalhos implies mesmaOrg[dev, r]
}

check trabalhaEmRepositorioDaMesmaOrganização for 5

assert quantidadeMaximaDeTrabalhos {
    all d : Desenvolvedor | !(#d.trabalhos > 5)
}

check quantidadeMaximaDeTrabalhos for 5

assert usuarioSemAcessos {
    some u : Usuario | !(#u.acessos >= 1)
}

check usuarioSemAcessos for 5

assert repositorioSemDesenvolvedor {
    some r : Repositorio | !(#trabalhos.r > 0)
}

check repositorioSemDesenvolvedor for 5

assert repositoiroTemOrganizacao{
    all r : Repositorio | #r.organizacao = 1
}
check repositoiroTemOrganizacao for 5


assert usuarioTemAteUmaOrganizacao {
    all u : Usuario | #u.organizacao = 1 or #u.organizacao = 0
}
check usuarioTemAteUmaOrganizacao

assert organizacaoNaoCompartilhaRepositorio {
    all r : Repositorio, o1, o2 : Organizacao | 
        (o1 = r.organizacao and o2 = r.organizacao) implies (o1 = o2)
}
check organizacaoNaoCompartilhaRepositorio for 5

pred exemplo {
    #Organizacao = 2
    #Repositorio = 3
    #Usuario = 4
    #Desenvolvedor = 2
}

run exemplo for 5
