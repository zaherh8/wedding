defmodule Wedding.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  @invitees [
    %{coming: true, first_name: "Ziad", group: "hassans", last_name: "Hassan"},
    %{coming: true, first_name: "Zahra", group: "hassans", last_name: "Hassan"},
    %{coming: true, first_name: "Zeina", group: "zg", last_name: "Hassan"},
    %{coming: true, first_name: "Ghassan", group: "zg", last_name: "Sadek"},
    %{coming: true, first_name: "Raymond", group: "SalibaFam", last_name: "Saliba"},
    %{coming: true, first_name: "Guitta", group: "SalibaFam", last_name: "Saliba"},
    %{coming: true, first_name: "Lea", group: "LeaFam", last_name: "Saliba"},
    %{coming: true, first_name: "Tarek A.", group: "LeaFam", last_name: "Allouche"},
    %{coming: true, first_name: "Moustafa", group: "AlloucheFam", last_name: "Allouche"},
    %{coming: true, first_name: "Ghina", group: "AlloucheFam", last_name: "Allouche"},
    %{coming: true, first_name: "Nabil", group: "nabjack", last_name: "Saliba"},
    %{coming: true, first_name: "Jacko", group: "nabjack", last_name: "Saliba"},
    %{coming: true, first_name: "Rita", group: "ritaFam", last_name: "Abdallah"},
    %{coming: true, first_name: "Walid", group: "ritaFam", last_name: "Abdallah"},
    %{coming: nil, first_name: "Nicole", group: "bijj", last_name: "Bijjani"},
    %{coming: nil, first_name: "Roni", group: "bijj", last_name: "Bijjani"},
    %{coming: nil, first_name: "Tony", group: nil, last_name: "Saliba"},
    %{coming: nil, first_name: "Mona", group: "chMona", last_name: "Aoun"},
    %{coming: nil, first_name: "Jhonny", group: nil, last_name: "Aoun"},
    %{coming: nil, first_name: "Charbel", group: "chMona", last_name: "Aoun"},
    %{coming: true, first_name: "Marie rose", group: "micha", last_name: "Mouawad"},
    %{coming: true, first_name: "Roger", group: "micha", last_name: "Mouawad"},
    %{coming: true, first_name: "micha", group: "micha", last_name: "Mouawad"},
    %{coming: true, first_name: "Ghassan", group: "ghnawal", last_name: "Saliba"},
    %{coming: true, first_name: "Nawal", group: "ghnawal", last_name: "Saliba"},
    %{coming: true, first_name: "Elie", group: "elieFam", last_name: "Saliba"},
    %{coming: true, first_name: "Rania", group: "elieFam", last_name: "Saliba"},
    %{coming: false, first_name: "Roger", group: "maryroger", last_name: "Saliba"},
    %{coming: false, first_name: "Mary", group: "maryroger", last_name: "Saliba"},
    %{coming: true, first_name: "Bernard", group: "bero", last_name: "Saliba"},
    %{coming: true, first_name: "Stephanie", group: "bero", last_name: "Saliba"},
    %{coming: nil, first_name: "Rima", group: "rimatoni", last_name: "Matar"},
    %{coming: nil, first_name: "Tony", group: "rimatoni", last_name: "Matar"},
    %{coming: true, first_name: "Clara", group: "zoe", last_name: "Matar"},
    %{coming: true, first_name: "Reneh", group: "zoe", last_name: "Sinn"},
    %{coming: true, first_name: "Zoey", group: "zoe", last_name: "Sinn"},
    %{coming: false, first_name: "Elie", group: "", last_name: "Matar"},
    %{coming: true, first_name: "Maria", group: "Marianicolas", last_name: "Matar"},
    %{coming: true, first_name: "Nicolas ", group: "Marianicolas", last_name: "Matar"},
    %{coming: true, first_name: "Charles", group: "charlescar", last_name: "Saliba"},
    %{coming: true, first_name: "Caroline", group: "charlescar", last_name: "Saliba"},
    %{coming: false, first_name: "Paul", group: "", last_name: "Saliba"},
    %{coming: false, first_name: "Luc ", group: "", last_name: "Saliba"},
    %{coming: true, first_name: "Mira", group: "", last_name: "Saliba"},
    %{coming: false, first_name: "Rocky", group: "", last_name: "Mouawad"},
    %{coming: false, first_name: "Tony", group: "tonihouda", last_name: "nehme"},
    %{coming: false, first_name: "Houda", group: "tonihouda", last_name: "nehme"},
    %{coming: false, first_name: "Jean-claude", group: "", last_name: "bassil"},
    %{coming: false, first_name: "Toni", group: "tonidani", last_name: "khoury"},
    %{coming: false, first_name: "Dani", group: "tonidani", last_name: "khoury"},
    %{coming: true, first_name: "Mirna", group: "Kassabs", last_name: "Kassab"},
    %{coming: true, first_name: "Zouzou", group: "Kassabs", last_name: "Kassab"},
    %{coming: true, first_name: "Elio", group: "Kassabs", last_name: "Kassab"},
    %{coming: true, first_name: "Nour", group: "Kassabs", last_name: "Kassab"},
    %{coming: true, first_name: "Sousou", group: "sousouabdo", last_name: "Jbeily"},
    %{coming: true, first_name: "Abdo", group: "sousouabdo", last_name: "Jbeily"},
    %{coming: nil, first_name: "Carla", group: "SamCarla", last_name: "Jbeily"},
    %{coming: nil, first_name: "Sam", group: "SamCarla", last_name: "Jbeily"},
    %{coming: true, first_name: "Katia", group: "", last_name: "Jbeily"},
    %{coming: false, first_name: "Yari", group: "", last_name: "Jbeily"},
    %{coming: nil, first_name: "Jamile", group: "joujou", last_name: "Jbeily"},
    %{coming: nil, first_name: "Chadi", group: "joujou", last_name: "Jbeily"},
    %{coming: nil, first_name: "Pascle", group: "joujou", last_name: "Jbeily"},
    %{coming: nil, first_name: "Leatitia", group: "LetiElias", last_name: "Rizk"},
    %{coming: nil, first_name: "Elias", group: "LetiElias", last_name: "Matar"},
    %{coming: nil, first_name: "Sabine", group: nil, last_name: "Allam"},
    %{coming: true, first_name: "Marilyne", group: "", last_name: "Naaman"},
    %{coming: true, first_name: "Sara", group: "", last_name: "Moussa"},
    %{coming: true, first_name: "Elias", group: "", last_name: "Elias"},
    %{coming: true, first_name: "Alondra", group: "", last_name: "Barakat"},
    %{coming: true, first_name: "Marc", group: "", last_name: "Khalil"},
    %{coming: true, first_name: "Melissa", group: "KassisFam", last_name: "Kassis"},
    %{coming: true, first_name: "Jad", group: "KassisFam", last_name: "Kassis"},
    %{coming: true, first_name: "Georgio", group: "", last_name: "Hanna"},
    %{coming: false, first_name: "Gaelle", group: "", last_name: "Maatouk"},
    %{coming: nil, first_name: "Raed ", group: "Bacouni", last_name: "Bacouni"},
    %{coming: nil, first_name: "Dania", group: "Bacouni", last_name: "Bacouni"},
    %{coming: true, first_name: "Sari", group: "", last_name: "Kahale"},
    %{coming: false, first_name: "Lea", group: "", last_name: "Mikhael"},
    %{coming: false, first_name: "Charbel", group: "Naser", last_name: "Naser"},
    %{coming: false, first_name: "Rana", group: "Naser", last_name: "Naser"},
    %{coming: true, first_name: "Pia", group: "PiaRay", last_name: "Asmar"},
    %{coming: true, first_name: "Raymond", group: "PiaRay", last_name: "Abi Antoun"},
    %{coming: false, first_name: "Chantal", group: "", last_name: "Mouawad"},
    %{coming: false, first_name: "Joseph", group: "", last_name: "Khawand"},
    %{coming: true, first_name: "Remi", group: "", last_name: "Abou Mrad"},
    %{coming: true, first_name: "Nanci", group: "AklFam", last_name: "Akl"},
    %{coming: true, first_name: "Gilbert", group: "AklFam", last_name: "Akl"},
    %{coming: true, first_name: "Aldo", group: "", last_name: "Yaghi"},
    %{coming: true, first_name: "Andre", group: "AndreElea", last_name: "Abou Issa"},
    %{coming: true, first_name: "Eleanor", group: "AndreElea", last_name: "Abou Issa"},
    %{coming: true, first_name: "Tatiana", group: "TatOli", last_name: "Matar"},
    %{coming: true, first_name: "Oliver", group: "TatOli", last_name: "Matar"},
    %{coming: nil, first_name: "Toni", group: "ToniDiana", last_name: "Alphonse"},
    %{coming: nil, first_name: "Diana", group: "ToniDiana", last_name: "Alphonse"},
    %{coming: nil, first_name: "Diana", group: "TeamDiana", last_name: "s"},
    %{coming: nil, first_name: "Joseph", group: "TeamDiana", last_name: "s"},
    %{coming: true, first_name: "Wadiaa", group: "", last_name: "Shami"},
    %{coming: true, first_name: "Marcelino", group: "", last_name: "Chidiac"},
    %{coming: true, first_name: "Samer", group: "", last_name: "Khattar"},
    %{coming: true, first_name: "Agatha", group: "", last_name: "x"},
    %{coming: false, first_name: "Mariah", group: "", last_name: "Damaj"},
    %{coming: true, first_name: "Eyad", group: "eyadFam", last_name: "Hassan"},
    %{coming: true, first_name: "Elham", group: "eyadFam", last_name: "Hassan"},
    %{coming: true, first_name: "sahar", group: "SaharFam", last_name: "Hassan"},
    %{coming: true, first_name: "alaa", group: "SaharFam", last_name: "Assaf"},
    %{coming: true, first_name: "Rayan", group: "eyadFam", last_name: "Hassan"},
    %{coming: true, first_name: "Dounia", group: "aamto", last_name: "Hassan"},
    %{coming: true, first_name: "Fouad", group: "aamto", last_name: "Sarryeddin"},
    %{coming: true, first_name: "Diala", group: "DialaFam", last_name: "Sarryeddin"},
    %{coming: false, first_name: "Abdalla", group: "DialaFam", last_name: "bou dehn"},
    %{coming: true, first_name: "Dolly", group: "DollyFam", last_name: "Sarryeddin"},
    %{coming: true, first_name: "Hovig", group: "DollyFam", last_name: "kohilian"},
    %{coming: true, first_name: "Dani", group: "aamto", last_name: "Sarryeddin"},
    %{coming: true, first_name: "Abir", group: "KatiaAbby", last_name: "Hassan"},
    %{coming: true, first_name: "Nadine", group: "", last_name: "Hassan"},
    %{coming: true, first_name: "Katia", group: "KatiaAbby", last_name: "Ghrayze"},
    %{coming: false, first_name: "Fadi", group: "FadiDalia", last_name: "Hassan"},
    %{coming: false, first_name: "Dalia", group: "FadiDalia", last_name: "Hassan"},
    %{coming: false, first_name: "Saaid", group: "", last_name: "Hassan"},
    %{coming: false, first_name: "Wassim", group: "WassimFam", last_name: "Hassan"},
    %{coming: false, first_name: "Reem", group: "WassimFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Nabila", group: "nizarFam", last_name: "El Baba"},
    %{coming: nil, first_name: "Dana", group: "nizarFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Nizar", group: "nizarFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Fadi", group: "FadiFaten", last_name: "Nasr El Din"},
    %{coming: nil, first_name: "Faten", group: "FadiFaten", last_name: "Nasr El Din"},
    %{coming: nil, first_name: "Ghaleb", group: "GhalebNouhad", last_name: "Yaacoub"},
    %{coming: nil, first_name: "Nouhad", group: "GhalebNouhad", last_name: "Yaacoub"},
    %{coming: true, first_name: "Ali", group: "KhaloAli", last_name: "Haidar"},
    %{coming: true, first_name: "Maha", group: "KhaloAli", last_name: "Naaous"},
    %{coming: true, first_name: "Karim", group: "KhaloAli", last_name: "Haidar"},
    %{coming: true, first_name: "Nour", group: "KhaloAli", last_name: "Haidar"},
    %{coming: nil, first_name: "Amal", group: "KhaltoAmal", last_name: "Haidar"},
    %{coming: nil, first_name: "Ahmad", group: "KhaltoAmal", last_name: "Elian"},
    %{coming: nil, first_name: "Basima", group: "fahedBasima", last_name: "Elian"},
    %{coming: nil, first_name: "Fahed ", group: "fahedBasima", last_name: "Elian"},
    %{coming: nil, first_name: "Shadi", group: "ShadiFam", last_name: "Elian"},
    %{coming: nil, first_name: "Douaa", group: "ShadiFam", last_name: "Elian"},
    %{coming: true, first_name: "Farah", group: "FarahFam", last_name: "Elian"},
    %{coming: true, first_name: "Mohamed", group: "FarahFam", last_name: "Kabalan"},
    %{coming: true, first_name: "Shaden", group: "ShadenFam", last_name: "Elian"},
    %{coming: true, first_name: "Maria", group: "ShadenFam", last_name: "Hassan"},
    %{coming: true, first_name: "Loulou", group: "ShadenFam", last_name: "Hassan"},
    %{coming: true, first_name: "Mahmoud", group: "ShadenFam", last_name: "Hassan"},
    %{coming: true, first_name: "Laila", group: "LaylaFam", last_name: "Haidar"},
    %{coming: true, first_name: "Hasan", group: "LaylaFam", last_name: "Ibrahim"},
    %{coming: true, first_name: "Sara", group: "LaylaFam", last_name: "Ibrahim"},
    %{coming: true, first_name: "Yara", group: "YaraM", last_name: "Ibrahim"},
    %{coming: true, first_name: "Mohamed", group: "YaraM", last_name: "Nasser"},
    %{coming: true, first_name: "Mira", group: "MiraAhmad", last_name: "Ibrahim"},
    %{coming: false, first_name: "Ahmad", group: "MiraAhmad", last_name: "Mira"},
    %{coming: nil, first_name: "Sou3ad", group: "SouadFam", last_name: "Haidar"},
    %{coming: nil, first_name: "Ali", group: "SouadFam", last_name: "Abou Mjir"},
    %{coming: nil, first_name: "Hussein", group: "RanaFam", last_name: "Al Ali"},
    %{coming: nil, first_name: "Rana", group: "RanaFam", last_name: "Abou Mjir"},
    %{coming: nil, first_name: "Mohamed", group: "nerminFam", last_name: "Haidar"},
    %{coming: nil, first_name: "Nermine", group: "nerminFam", last_name: "Salemeh"},
    %{coming: nil, first_name: "Ram", group: "nerminFam", last_name: "Haidar"},
    %{coming: nil, first_name: "Isha", group: "nerminFam", last_name: "Haidar"},
    %{coming: nil, first_name: "Ola", group: nil, last_name: "Haidar"},
    %{coming: nil, first_name: "Kati", group: "KatiFam", last_name: "Mansour"},
    %{coming: nil, first_name: "Samir", group: "KatiFam", last_name: "Fawaz"},
    %{coming: nil, first_name: "Nada", group: nil, last_name: "Khsheish"},
    %{coming: nil, first_name: "Yolla", group: nil, last_name: "Kharrat"},
    %{coming: nil, first_name: "Hanan", group: "HananFam", last_name: "Yassine"},
    %{coming: nil, first_name: "Marc", group: "HananFam", last_name: "Du Bras"},
    %{coming: nil, first_name: "Lida", group: nil, last_name: "Saliba"},
    %{coming: true, first_name: "Tarek", group: "", last_name: "Yassine"},
    %{coming: true, first_name: "Daniel", group: "", last_name: "Abbas"},
    %{coming: true, first_name: "hatem", group: "", last_name: "Eid"},
    %{coming: false, first_name: "Elie", group: "", last_name: "Salemeh"},
    %{coming: true, first_name: "Marwan", group: "", last_name: "El Ghoul"},
    %{coming: true, first_name: "Gaelle", group: "", last_name: "Dagher"},
    %{coming: nil, first_name: "Carlos", group: nil, last_name: "Lomba"},
    %{coming: nil, first_name: "Rachael", group: nil, last_name: "Lomba"},
    %{coming: false, first_name: "Roy", group: "", last_name: "Sarryeddin"},
    %{coming: nil, first_name: "Opeyemi", group: nil, last_name: "Badmos"},
    %{coming: true, first_name: "Emmanuel", group: "", last_name: "Balogun"},
    %{coming: true, first_name: "Elizabeth", group: "", last_name: "Ojo"},
    %{coming: nil, first_name: "Rafa", group: nil, last_name: "Antunes"},
    %{coming: true, first_name: "Rafael", group: "", last_name: "Abbas"},
    %{coming: true, first_name: "Olga", group: "", last_name: "Abbas"},
    %{coming: true, first_name: "Kassem", group: "", last_name: "Yassine"},
    %{coming: true, first_name: "Eman", group: "", last_name: "Yassine"},
    %{coming: true, first_name: "Celine", group: "", last_name: "Salloum"},
    %{coming: true, first_name: "George", group: "", last_name: "Mouawad"},
    %{coming: nil, first_name: "Youssef", group: nil, last_name: "Samadi"},
    %{coming: nil, first_name: "Mira", group: nil, last_name: "Samadi"},
    %{coming: true, first_name: "Youssef", group: "", last_name: "Al Ashkar"},
    %{coming: false, first_name: "Shawki", group: "", last_name: "Daou"},
    %{coming: false, first_name: "Sonia", group: "", last_name: "El Eid"},
    %{coming: nil, first_name: "Randa", group: "RandaFam", last_name: "Nammour"},
    %{coming: nil, first_name: "Yara", group: "RandaFam", last_name: "Farhat"},
    %{coming: nil, first_name: "Jad", group: "RandaFam", last_name: "Farhat"},
    %{coming: nil, first_name: "Cezar", group: "RandaFam", last_name: "Farhat"},
    %{coming: nil, first_name: "Naji", group: "NajiFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Lara", group: "NajiFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Norma", group: "NajiFam", last_name: "Hassan"},
    %{coming: nil, first_name: "Melissa", group: nil, last_name: "Ishak"},
    %{coming: true, first_name: "Sara", group: "SaraFadi", last_name: "Abi Younes"},
    %{coming: true, first_name: "Fadi", group: "SaraFadi", last_name: "Abou Abdallah"},
    %{coming: false, first_name: "Elio", group: "", last_name: "Melhem"},
    %{coming: true, first_name: "Lynn", group: "", last_name: "Tawile"},
    %{coming: false, first_name: "Rabih", group: "RabihFam", last_name: "Hassan"},
    %{coming: false, first_name: "Tania", group: "RabihFam", last_name: "Jounblat"},
    %{coming: nil, first_name: "Ahmad", group: "ShadiFam", last_name: "Shadi Elian"},
    %{coming: nil, first_name: "Hisham", group: "HishamFam", last_name: "Abou Khzem"},
    %{coming: nil, first_name: "Khouloud", group: "HishamFam", last_name: "Al Basha"}
  ]
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      # Start the Telemetry supervisor
      Wedding.Repo,
      WeddingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Wedding.PubSub},
      # Start the Endpoint (http/https)
      WeddingWeb.Endpoint
      # Start a worker by calling: Wedding.Worker.start_link(arg)
      # {Wedding.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Wedding.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def start_phase(:seed_db, _, _) do
    Wedding.Release.create_and_migrate()

    invitees =
      @invitees
      |> Enum.map(fn %{
                       first_name: first_name,
                       last_name: last_name,
                       group: group,
                       coming: coming?
                     } ->
        %{
          first_name: first_name |> String.trim() |> String.downcase(),
          last_name: last_name |> String.trim() |> String.downcase(),
          group: group,
          coming: coming?
        }
      end)

    Wedding.Repo.insert_all(Wedding.Invitees.Invitee, invitees, on_conflict: :nothing)

    :ok
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WeddingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
