<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehicles_Orders.aspx.cs" Inherits="KrishiSadhana.Administrator.Vehicles_Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
    .sidebar {
      min-width : 230px;
      height: 100vh;
      background-color: #2c3e50;
      color: white;
    }

    .sidebar a {
      text-decoration: none;
      color: #fff;
      padding: 12px;
      display: block;
      border-radius: 5px;
    }

    .sidebar a.active {
      background-color: #007bff;
    }

    .sidebar a:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .content {
      flex-grow: 1;
      padding: 20px;
      overflow-y: auto;
    }

    .header {
      background-color: #2c3e50;
      padding: 10px 20px;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logout-btn {
      background-color: white;
      color: black;
      border-radius: 5px;
      padding: 5px 10px;
      border: none;
    }

     body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
    }

    .header {
      background-color: #212529;
      color: white;
      padding: 15px 20px;
      font-weight: 600;
      font-size: 24px;
      border-bottom:solid 3px rgb(108 117 125);
    }

    .container-fluid {
      display: flex;
    }

    .sidebar {
      width: 250px;
      background-color: #212529;
      color: white;
      height: 100vh;
      padding: 20px 0;
    }

    .sidebar a {
      text-decoration: none;
      color: #fff;
      padding: 12px 20px;
      display: block;
      border-radius: 5px;
    }

    .sidebar a.active {
      background-color: #007bff;
    }

    .sidebar a:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .content {
      flex-grow: 1;
      padding: 20px;
      overflow-y: auto;
    }
  </style>
</head>
<body>

    <!-- Top bar -->
     <!-- Header Section -->
  <div class="header">
    <h3>DC Hotels</h3>
    <button class="btn btn-sm logout-btn">LOG OUT</button>
  </div>
    

    <!-- Starting sidebar -->
    <!-- Main Layout -->
  <div class="d-flex">
    <!-- Sidebar Section -->
    <div class="sidebar d-flex flex-column p-3">
      <h4 class="mb-4 text-light">ADMIN PANEL</h4>


      <a href="Dashboard.aspx" class="active">Dashboard</a>
      <a href="Categoreis.aspx">Categoreis</a>
      <a href="Products.aspx">Products</a>
      <a href="Orders.aspx">Orders</a>
      <a href="Vehicles_Orders.aspx">Vehicles Orders</a>
      <a href="Doctors.aspx">Doctors</a>
      <a href="User_Queries.aspx">User Queries</a>
      <a href="Vehicles.aspx">Vehicles</a>
      <a href="Users.aspx">Users</a>
      <a href="AllAdmins.aspx">Admins</a>


    </div>

      <!-- Content Section -->
    <div class="content">
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dolorum eaque dolore impedit perspiciatis culpa,
        accusantium amet unde voluptatibus obcaecati facere laborum commodi accusamus eum ipsum quod asperiores provident.
        Doloremque error nesciunt aliquid voluptas magnam voluptas ipsum! Cupiditate, voluptas ipsa? Aperiam nihil tempore
        voluptatum quos iure reiciendis laboriosam sapiente commodi enim doloribus.
      </p>
      <p>
        Modi deleniti perferendis minima, ab et autem pariatur corporis maxime architecto adipisci nulla dolorem debitis.
        Corrupti adipisci expedita, sed neque veniam tempora cumque ut consectetur, fugiat laudantium.

          Lorem ipsum dolor sit amet consectetur adipisicing elit. Quasi totam harum maxime! Ut, accusantium nihil perferendis earum quia ad iure, veniam sint quas harum incidunt, cumque recusandae ullam dignissimos quibusdam sit maxime placeat. Perferendis, pariatur. Quos dignissimos iure libero eligendi. Aliquam ipsa sit similique porro excepturi consequatur voluptas animi perferendis. Suscipit corporis ab libero molestias perferendis vitae nemo voluptatum magni? Accusantium provident unde quam amet aperiam possimus! Veritatis sunt ea delectus suscipit. Harum ducimus ipsam iure quo aliquid repellat, tempore, hic iusto pariatur delectus modi nam. Non at expedita odio illo. Veniam dolor mollitia fuga ut beatae? Dolorem aut nam dicta, nihil quisquam facilis veritatis veniam, distinctio voluptates aperiam illum ea expedita voluptatibus quas non deleniti! Incidunt harum mollitia laborum blanditiis asperiores ex qui atque molestiae eos recusandae non beatae eum modi dolorum, sequi, ea accusantium laboriosam perspiciatis autem impedit doloribus provident molestias officia! Adipisci laudantium nesciunt similique tempore molestias autem impedit accusantium nobis. Officiis, eligendi nihil aliquid in quidem facilis consectetur placeat? Ipsa voluptate repellat inventore temporibus eaque beatae quod, reprehenderit saepe aliquid neque eveniet quae laudantium quas perferendis! Inventore, voluptates corrupti dolorum reprehenderit, nihil vel odio veniam quas obcaecati alias vitae et delectus distinctio neque quam. Nesciunt repellendus, corporis harum dicta eos quod dolorum explicabo recusandae. Accusamus alias doloribus voluptatum repellat provident eveniet nam labore est, accusantium temporibus nihil adipisci reprehenderit, quam atque totam nobis, dolore eligendi excepturi dolor pariatur earum? Vero, saepe aliquid magni ut quasi dolorum distinctio dolore suscipit eos? Voluptatem laboriosam vel molestias ipsum corrupti laborum voluptas. Necessitatibus saepe hic quidem tempora nisi at, reprehenderit tempore quasi ea fuga delectus sint beatae esse magni magnam harum deleniti. Quas deleniti ducimus quidem aspernatur, inventore nam debitis consectetur reprehenderit saepe, voluptates asperiores similique vel, quaerat error facilis et doloremque. Quo ut provident delectus dolores quis earum quae nesciunt tempora, asperiores unde exercitationem quam eligendi maiores deserunt beatae ducimus! Praesentium dolorum incidunt tempora possimus labore quae nihil. Perspiciatis dolor enim facere. Doloribus ut et ullam eaque tempore incidunt maiores debitis, consequuntur nobis alias ab iste amet rerum. Perspiciatis doloremque omnis iusto quaerat placeat ratione vero, at corporis minus! Animi optio provident a nesciunt. Nemo soluta unde sapiente consectetur, veniam ducimus impedit ab fugit. Rerum, deleniti? Optio atque, repellat ipsa fuga quasi a eos perspiciatis vel reprehenderit. Eum reiciendis debitis distinctio perspiciatis sint blanditiis officiis magnam obcaecati at! Optio soluta quasi necessitatibus, atque adipisci officia perferendis, assumenda totam nisi reiciendis nesciunt sed molestias saepe laudantium perspiciatis sapiente molestiae eius, doloribus id! Atque, veniam tempora quia eius corrupti explicabo inventore cumque nesciunt vero blanditiis repudiandae, perspiciatis impedit. Accusamus obcaecati excepturi placeat nisi distinctio rem provident necessitatibus expedita debitis similique? Nesciunt animi at aliquam minus consequatur voluptates fugit? Aliquam, possimus? Ratione cupiditate autem iusto, doloribus blanditiis possimus voluptates odio, accusantium eaque corporis aut itaque iure doloremque, laudantium deserunt velit voluptate provident? Labore, itaque. Alias facilis voluptates iusto enim, incidunt natus autem amet aut accusantium eius consequuntur illo possimus tempora doloribus quasi nemo corrupti eaque minima cupiditate rem at modi ex magni. Deserunt aut sequi, iusto enim fugiat vel in dolor eos earum eum quasi unde recusandae nobis temporibus accusantium illo aliquid, natus autem! Amet temporibus quam ad exercitationem pariatur. Nemo aperiam corporis reprehenderit fugit! Hic qui doloremque reiciendis harum vero at officiis fugiat totam voluptatem inventore, soluta quod, facere ipsum aperiam? Autem velit quis dicta, illum aliquid animi doloremque commodi iste at soluta ipsam pariatur. Magnam delectus quidem quisquam doloremque eos at exercitationem minima accusamus, magni eligendi qui veniam et? Quibusdam veritatis corrupti nihil neque. Facilis laudantium sequi quibusdam molestiae non, consequatur labore officia veniam ipsa possimus repellendus praesentium quam cupiditate! Obcaecati omnis laborum voluptate unde velit illo rem, ex fugiat quidem, consectetur vero voluptatum iusto eum et ullam modi beatae! Voluptatem omnis obcaecati molestias ducimus recusandae ea fugiat est inventore, repudiandae dolorum vel quos modi, error commodi distinctio ipsam eligendi in quasi dignissimos natus voluptate sequi. Sed recusandae harum ipsa qui! Voluptatibus placeat laudantium commodi deserunt sit cupiditate eius magnam esse consequuntur itaque, ipsam cumque, iure blanditiis dignissimos repellendus soluta velit nihil inventore eum, laborum unde nostrum accusantium reiciendis omnis? Reiciendis obcaecati eius fugiat debitis distinctio odio necessitatibus, nisi molestiae natus! Ducimus optio omnis minus quia doloribus nisi laboriosam ipsa vitae, modi eum harum, maiores, corrupti natus repellat fugiat quas repellendus aliquid quidem atque fuga id accusantium itaque esse vel? In ducimus nemo saepe assumenda minima, repellendus magnam nesciunt culpa, temporibus explicabo itaque deleniti cupiditate deserunt quisquam nisi, molestias animi nam omnis. Quaerat animi id nesciunt error, ab fuga minima cumque ipsa ullam pariatur, soluta eligendi. Doloribus suscipit similique neque explicabo in atque officiis quo. Quasi tenetur ducimus, quaerat natus nam voluptatum. Obcaecati, quo sint itaque corporis cumque sunt repellat quibusdam deserunt optio similique aut! Porro dolore iure voluptas, autem non aspernatur veniam excepturi nihil delectus aliquid eligendi sint deserunt, recusandae repudiandae architecto aperiam? Ipsam veniam aut quam sint similique dolore dolor iusto perferendis officia. Hic quibusdam labore aliquam, voluptates deleniti, omnis soluta enim est, nulla totam nemo itaque. Laborum maiores nulla autem accusamus fugit dolorem ratione iure nisi error, optio sunt, eveniet alias fuga mollitia repudiandae nihil quos, in doloribus aliquam natus eos illum dolore? Odit repellendus ut, vero libero aliquid, sunt odio vel velit est fugit numquam similique eligendi, natus laboriosam dolor minima ipsa. Commodi sapiente consequuntur tenetur provident voluptate placeat aliquam, iste veniam laudantium incidunt saepe quam, quas quisquam obcaecati eum, voluptatibus odit. Repellendus voluptas placeat suscipit iste dolorum, veniam recusandae officia dolorem corporis nam cupiditate facere, voluptatem voluptatum ipsa, laborum minima molestiae repudiandae doloribus quisquam eos numquam repellat. Ab iure placeat cum, alias animi ea tenetur delectus dolores, molestiae natus quod, eius excepturi id minus! Deserunt fugiat in nostrum. Ducimus modi repellendus nemo culpa. Quisquam, laboriosam? Temporibus ad ex sapiente atque error eum soluta iusto sequi animi. Sed mollitia dicta libero tenetur corrupti consequuntur doloribus modi architecto, cupiditate alias quae, vitae assumenda? Deserunt non quibusdam omnis voluptates in voluptate iusto dolor, excepturi, blanditiis nisi temporibus est quas quam molestiae repellendus, explicabo neque? Adipisci sint repudiandae tenetur laboriosam, eligendi excepturi sit minima tempora voluptatum exercitationem quibusdam suscipit soluta quo dolor cupiditate animi molestiae impedit ad placeat, at, esse accusamus! Magni maiores, deserunt delectus repudiandae vitae quia, repellat impedit ullam commodi similique eligendi corporis. Numquam ad vitae voluptatibus rem alias reiciendis repellat, facilis tempore quibusdam dolore quidem dolorem fuga totam? At aliquid voluptatibus eos aliquam nesciunt dolorem. Quae iste aliquam facilis beatae fugit deserunt alias, tempora laborum illum ipsam accusantium deleniti dolore ex repudiandae, libero quam porro magni ab ullam quos nesciunt repellendus at. Quaerat velit id nobis sapiente optio facilis dicta amet asperiores, atque voluptatem fugit veritatis placeat nesciunt sequi voluptatum eum ut nihil omnis corrupti accusantium ex modi natus in. Voluptas, beatae sit similique explicabo quia delectus, distinctio itaque ea nesciunt illo, impedit ducimus cum ut veniam quas corporis! Animi soluta sapiente voluptate aliquam saepe veritatis, expedita ducimus dolor delectus tempora distinctio voluptatum tenetur nihil inventore ab accusamus doloremque dignissimos repudiandae est, provident minima. Excepturi distinctio officia laudantium esse eius delectus laboriosam, perspiciatis dignissimos a deserunt quod eaque ad atque temporibus ut veritatis praesentium incidunt tempora explicabo quibusdam quam, iste corporis? Magnam, optio non ducimus nemo tempora qui hic cum, architecto minima corporis, consequuntur natus itaque. Dolor ea illum corrupti dolores. Voluptates et numquam, magnam nisi nesciunt cupiditate modi reprehenderit provident ipsum nemo quae eius eos, alias debitis, tenetur voluptas ea ratione in quos totam a deleniti repellat! Earum non possimus vel veritatis aperiam expedita iure odio quibusdam deleniti rem fugit incidunt vero veniam harum assumenda corrupti nesciunt et, molestiae, delectus perspiciatis sit, tempore eum natus. Eius rem officia alias laudantium maiores cum nesciunt esse ut, quas ex pariatur quae libero facilis ea magnam assumenda? At recusandae nihil porro. Quod eveniet obcaecati ea, ipsam sequi error, delectus, veniam velit voluptatum quam possimus modi consequatur corporis. Beatae consectetur officia ad cumque tenetur alias facilis, laboriosam laudantium eius quaerat atque vel animi, eligendi consequatur sunt magni hic! A, iure tempora. Voluptate quas itaque sed labore optio. Quibusdam voluptatum sapiente ad natus libero recusandae nobis, inventore consectetur esse dolore iure alias quos doloribus iusto commodi magnam quas cumque doloremque magni expedita. Dicta magni est dolore saepe quia animi recusandae reiciendis vitae repellendus dignissimos quas error, ea quasi reprehenderit quod neque voluptate ab sint voluptatum, quis mollitia eos magnam. Architecto libero similique ratione vitae iure facilis quas amet maxime nam quos porro pariatur tempore, facere possimus sed dignissimos modi quam, aspernatur nihil aut? Vitae cumque minus ipsum fuga numquam. Sunt, deleniti. Voluptatem dolores maxime perspiciatis facere aspernatur, itaque quia illum laudantium quis atque quasi suscipit excepturi iure magnam sapiente qui? Ducimus in vel libero blanditiis quae beatae similique aut officiis illo dolor, nostrum exercitationem, autem et magnam praesentium eum repellat ipsam accusamus, eaque cum temporibus obcaecati! Dolorem, numquam doloremque recusandae dolorum, inventore accusamus adipisci velit molestias aut ullam aspernatur odio? Non vero, facere delectus eveniet veritatis aut iste rerum optio at laborum reprehenderit ab impedit quam. Repellendus porro eos molestias perspiciatis doloremque necessitatibus numquam, eveniet cupiditate aperiam dolor non odio aliquam soluta minima quam beatae rerum reiciendis? Ea laboriosam qui, odio praesentium eum vitae minus voluptatibus. Distinctio accusamus odio consequatur nesciunt. Totam itaque hic suscipit, aut deleniti, ducimus assumenda fugiat quaerat ea illum omnis. Quis aperiam, eos assumenda numquam similique placeat sunt neque magnam dolor porro vitae! Beatae quia excepturi expedita doloribus sit ullam in illo provident nihil quis vel laudantium quaerat perspiciatis impedit quam eos architecto, dolor magni. Aspernatur, aut debitis odio adipisci assumenda est pariatur laborum consequatur maxime illum! Facilis, incidunt! Minus adipisci atque nam doloribus, facilis amet error saepe quis ea, provident vero, tempora deleniti! Beatae animi distinctio nostrum et soluta a laboriosam ipsum voluptates possimus dolores, fugit temporibus corporis officiis cumque numquam repellendus saepe, facilis ut explicabo harum? Quidem perferendis necessitatibus quod dolores rerum, ea minima quia esse id, aspernatur, possimus nisi dolorem tempora accusantium repudiandae quis asperiores quae tempore facere natus sint facilis alias nam rem. Dolores, rerum soluta. At corrupti quos sed natus tempore magni modi velit ad facere, obcaecati, iste est. Quo asperiores, molestias voluptates, non voluptatibus cupiditate aliquid ab culpa sit animi perferendis voluptatem. Cumque voluptatem illum sit esse, et nesciunt tenetur. Autem cum ex accusamus? Ex cumque vero maiores amet. Laborum quidem quam nobis dolor! Recusandae, dignissimos quasi natus cupiditate magnam saepe qui? Consectetur eius, pariatur in voluptates modi ratione amet aliquid sequi obcaecati officia numquam consequuntur perferendis delectus quae praesentium doloribus quis, illo tempore nemo assumenda minima suscipit, laudantium aperiam. Debitis accusantium, quia sapiente vel vero officiis, similique recusandae magnam repellat odit quam porro. Deserunt sunt perspiciatis asperiores ipsum iste nihil magnam laboriosam. Voluptatibus dolorum, sint iusto voluptate non obcaecati voluptates architecto, earum reiciendis quia maxime autem vel inventore iure, ipsum repellendus quidem tempora eveniet? Minus illo libero sed sequi, dolores ipsa facere maiores repellendus cupiditate eveniet at aperiam ad numquam reprehenderit. Molestias fugiat velit porro obcaecati, atque harum dolor cumque vel error tempora molestiae voluptatum quis voluptate veniam, doloribus tenetur quas. Dicta ex dignissimos, earum illo iusto quasi architecto recusandae et beatae. Adipisci dolore velit porro voluptatibus temporibus qui, minus aperiam corrupti incidunt necessitatibus possimus enim expedita ab corporis eveniet odio dolores doloremque pariatur? Facere consequuntur voluptates dicta repudiandae esse autem illum inventore, nobis molestiae, suscipit sint cumque ab magnam repellendus magni aliquid voluptatibus dolore veniam placeat earum? Nam rem quasi quia amet laborum obcaecati assumenda animi et aut! Impedit numquam sed soluta, iusto itaque, necessitatibus accusantium excepturi, ipsam voluptatum deleniti autem qui? Omnis nam reiciendis praesentium beatae eveniet, laudantium debitis aliquid sapiente repellat possimus assumenda quidem voluptatum velit cupiditate blanditiis nisi similique. Expedita quam ad tempora aspernatur aliquid suscipit saepe laboriosam iusto veniam, inventore quasi illo fuga laborum nihil qui laudantium sapiente obcaecati sit temporibus impedit esse, a doloremque rerum nemo? Explicabo voluptatum omnis iste rerum neque ad hic ea ex dolores quo ipsum nostrum blanditiis aliquid nihil tenetur cumque pariatur possimus, est, numquam quos nam? Distinctio, natus. Quos enim quis dolor nulla illum molestiae alias dolorum at suscipit provident quae mollitia labore unde, laudantium ab amet aliquid.
      </p>
    </div>
  </div>
    


    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
