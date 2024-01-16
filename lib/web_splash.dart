library web_splash;
import 'dart:io';

class WebSplash {
  void create() {
    try {
      final webIndex = File('web/index.html');

      final originalHtml = webIndex.readAsStringSync();

      String modifiedHtml = originalHtml.replaceAllMapped(
        RegExp(r'<body>([\s\S]*?)<\/body>'),
            (match) => '<body>$_document</body>',
      );


      webIndex.writeAsStringSync(modifiedHtml);
      print(
        '''
                                                                                                                                                               
        FFFFFFFFFFFFFFFFFFFFFFIIIIIIIIIIRRRRRRRRRRRRRRRRR   EEEEEEEEEEEEEEEEEEEEEE   SSSSSSSSSSSSSSS      OOOOOOOOO     FFFFFFFFFFFFFFFFFFFFFFTTTTTTTTTTTTTTTTTTTTTTT
        F::::::::::::::::::::FI::::::::IR::::::::::::::::R  E::::::::::::::::::::E SS:::::::::::::::S   OO:::::::::OO   F::::::::::::::::::::FT:::::::::::::::::::::T
        F::::::::::::::::::::FI::::::::IR::::::RRRRRR:::::R E::::::::::::::::::::ES:::::SSSSSS::::::S OO:::::::::::::OO F::::::::::::::::::::FT:::::::::::::::::::::T
        FF::::::FFFFFFFFF::::FII::::::IIRR:::::R     R:::::REE::::::EEEEEEEEE::::ES:::::S     SSSSSSSO:::::::OOO:::::::OFF::::::FFFFFFFFF::::FT:::::TT:::::::TT:::::T
          F:::::F       FFFFFF  I::::I    R::::R     R:::::R  E:::::E       EEEEEES:::::S            O::::::O   O::::::O  F:::::F       FFFFFFTTTTTT  T:::::T  TTTTTT
          F:::::F               I::::I    R::::R     R:::::R  E:::::E             S:::::S            O:::::O     O:::::O  F:::::F                     T:::::T        
          F::::::FFFFFFFFFF     I::::I    R::::RRRRRR:::::R   E::::::EEEEEEEEEE    S::::SSSS         O:::::O     O:::::O  F::::::FFFFFFFFFF           T:::::T        
          F:::::::::::::::F     I::::I    R:::::::::::::RR    E:::::::::::::::E     SS::::::SSSSS    O:::::O     O:::::O  F:::::::::::::::F           T:::::T        
          F:::::::::::::::F     I::::I    R::::RRRRRR:::::R   E:::::::::::::::E       SSS::::::::SS  O:::::O     O:::::O  F:::::::::::::::F           T:::::T        
          F::::::FFFFFFFFFF     I::::I    R::::R     R:::::R  E::::::EEEEEEEEEE          SSSSSS::::S O:::::O     O:::::O  F::::::FFFFFFFFFF           T:::::T        
          F:::::F               I::::I    R::::R     R:::::R  E:::::E                         S:::::SO:::::O     O:::::O  F:::::F                     T:::::T        
          F:::::F               I::::I    R::::R     R:::::R  E:::::E       EEEEEE            S:::::SO::::::O   O::::::O  F:::::F                     T:::::T        
        FF:::::::FF           II::::::IIRR:::::R     R:::::REE::::::EEEEEEEE:::::ESSSSSSS     S:::::SO:::::::OOO:::::::OFF:::::::FF                 TT:::::::TT      
        F::::::::FF           I::::::::IR::::::R     R:::::RE::::::::::::::::::::ES::::::SSSSSS:::::S OO:::::::::::::OO F::::::::FF                 T:::::::::T      
        F::::::::FF           I::::::::IR::::::R     R:::::RE::::::::::::::::::::ES:::::::::::::::SS    OO:::::::::OO   F::::::::FF                 T:::::::::T      
        FFFFFFFFFFF           IIIIIIIIIIRRRRRRRR     RRRRRRREEEEEEEEEEEEEEEEEEEEEE SSSSSSSSSSSSSSS        OOOOOOOOO     FFFFFFFFFFF                 TTTTTTTTTTT      
                                                                                                                                                                     
                                                                                                                                                        
        ╔════════════════════════════════════════════════════════════════════════════╗
        ║                             web_splash                                     ║
        ╚════════════════════════════════════════════════════════════════════════════╝
        ===> Web splash created successfully!
        If you want to change the image, change the src path in the <img src="icons/Icon-192.png" alt="Loading indicator..." /> field in the web/index.html file.
        ''',
      );
    } catch (e) {
      print(e);
    }
  }


  final _document = '''
<style>
      body {
        background-color: #030303;
      }
    </style>
<div id="loading">
  <style>
        body {
          inset: 0;
          overflow: hidden;
          margin: 0;
          padding: 0;
          position: fixed;
        }

        #loading {
          align-items: center;
          display: flex;
          height: 100%;
          justify-content: center;
          width: 100%;
        }

        #loading img {
          animation: 1s ease-in-out 0s infinite alternate breathe;
          opacity: 0.66;
          transition: opacity 0.4s;
        }

        #loading.main_done img {
          opacity: 1;
        }

        #loading.init_done img {
          animation: 0.33s ease-in-out 0s 1 forwards zooooom;
          opacity: 0.05;
        }

        @keyframes breathe {
          from {
            transform: scale(1);
          }

          to {
            transform: scale(0.95);
          }
        }

        @keyframes zooooom {
          from {
            transform: scale(1);
          }

          to {
            transform: scale(10);
          }
        }
      </style>
  <img src="icons/Icon-192.png" alt="Loading indicator..." />
</div>
<script>
      window.addEventListener("load", function () {
        var loading = document.querySelector("#loading");
        _flutter.loader
          .loadEntrypoint({
            serviceWorker: {
              serviceWorkerVersion: serviceWorkerVersion,
            },
          })
          .then(function (engineInitializer) {
            loading.classList.add("main_done");
            return engineInitializer.initializeEngine();
          })
          .then(function (appRunner) {
            loading.classList.add("init_done");
            return appRunner.runApp();
          })
          .then(function (app) {
            // Wait a few milliseconds so users can see the "zoooom" animation
            // before getting rid of the "loading" div.
            window.setTimeout(function () {
              loading.remove();
            }, 200);
          });
      });
    </script>
    ''';

}