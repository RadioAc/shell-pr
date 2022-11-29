//引入shjs
var projectFatherDir = '/d/code'
var projectNameArr = [ "test", "oneci" ]
var sh = require('shelljs')

//检查控制台是否以运行`git `开头的命令
if (!sh.which('git')) {
  //在控制台输出内容
  sh.echo('Sorry, this script requires git');
  sh.exit(1);
}

// sh.rm('-rf','out/Release');//强制递归删除`out/Release目录`
// sh.cp('-R','stuff/','out/Release');//将`stuff/`中所有内容拷贝至`out/Release`目录

// sh.cd('lib');//进入`lib`目录
// //找出所有的扩展名为js的文件，并遍历进行操作
// sh.ls('*.js').forEach(function (file) {
//   /* 这是第一个难点：sed流编辑器,建议专题学习，-i表示直接作用源文件 */
//   //将build_version字段替换为'v0.1.2'
//   sh.sed('-i', 'BUILD_VERSION', 'v0.1.2', file);
//   //将包含`REMOVE_THIS_LINE`字符串的行删除
//   sh.sed('-i', /^.*REMOVE_THIS_LINE.*$/, '', file);
//   //将包含`REPLACE_LINE_WITH_MACRO`字符串的行替换为`macro.js`中的内容
//   sh.sed('-i', /.*REPLACE_LINE_WITH_MACRO.*\n/, sh.cat('macro.js'), file);
// });

// //返回上一级目录
// sh.cd('..');

// //run external tool synchronously
// //即同步运行外部工具
// if (sh.exec('git commit -am "Auto-commit"').code !== 0){
//     sh.echo('Error: Git commit failed');
//     sh.exit(1);
// }

sh.cd('..');

// sh.cd('/d/code');

// sh.ls('-l').forEach(function (dir) {
//   // sh.exec('dirname', dir)
//   sh.echo(dir.name)
//   // if (dir.name == 'test') {
//   //     sh.cd(dir.name)
//   //     sh.pwd()
//   // }
// });

// for (let index = 0; index < projectNameArr.length; index++) {
//     const element = projectNameArr[index];
//     sh.echo(element)
//     projectMain(element)
// }

// sh.exec('node --version').code

// sh.exec('node --version').output

sh.exec('node --version', (code, output) => {
    sh.echo(`exit code ${code}`)
})



// sh.tempdir()

// sh.error()

// sh.cd('/d/code')


// function projectMain (dir) {
//     sh.cd(dir)
//     sh.exec('git pull', (code, output) => {
//         sh.echo(`exit code ${code}`)
//     })
//     sh.cd('..')
// }

sh.echo(sh.pwd())
// sh.cd('D:/code/test')
