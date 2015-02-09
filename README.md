Установка и настройка
---------------------

    > ./install

Запуск
------

    > ./start       # gulp watch

Дальше открываем браузер http://localhost:9000

http://livereload.com/ в помощь!


Билд
----

    > ./build


Публикация
----------

   > ./publicate


Процесс gulp
------------

1. Исходник `./scripts/main.coffee` билдится с помощью `browserify` и превращается в `./scripts/bundle.js`
2. Стиль `./stylesheepts/app.sass` собирается в `./stylesheets/app.css`
с помощью gulp-sass (node-sass, libsass).
3. Сторонние пакеты устанавливаются через bundle в `app/bower_components` и билдятся в `./scripts/vendor.js`


Ограничение по браузерам:
------------------------

Текущие ограничения:

* Firefox >=25
* IE10+
* Opera 12+
* Chrome >=27
* Safari >-6
* Mobile Safair on iPhone and iPad >= 6

Ограничения для приложения в целом устанавливаются согласно максимальным ограничениям компонентов.

## ReactJS

* IE >= 9, Chrome >= 27, Firefox >= 25, Safari >= 6 and Mobile Safari on iPhone and iPad >= 6

## jQueryFileUpload:

https://github.com/blueimp/jQuery-File-Upload/wiki/Browser-support

### Desktop browsers

* Google Chrome
* Apple Safari 4.0+
* Mozilla Firefox 3.0+
* Opera 11.0+
* Microsoft Internet Explorer 6.0+

### Mobile browsers

* Apple Safari on iOS 6.0+
* Google Chrome on iOS 6.0+
* Google Chrome on Android 4.0+
* Default Browser on Android 2.3+
* Opera Mobile 12.0+

## HTML5 FileReader

* Firefox 3.6+, IE10+, and Opera 12+.

test
