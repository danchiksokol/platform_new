<?php

declare(strict_types=1);

namespace PackageVersions;

use Composer\InstalledVersions;
use OutOfBoundsException;

class_exists(InstalledVersions::class);

/**
 * This class is generated by composer/package-versions-deprecated, specifically by
 * @see \PackageVersions\Installer
 *
 * This file is overwritten at every run of `composer install` or `composer update`.
 *
 * @deprecated in favor of the Composer\InstalledVersions class provided by Composer 2. Require composer-runtime-api:^2 to ensure it is present.
 */
final class Versions
{
    /**
     * @deprecated please use {@see self::rootPackageName()} instead.
     *             This constant will be removed in version 2.0.0.
     */
    const ROOT_PACKAGE_NAME = '__root__';

    /**
     * Array of all available composer packages.
     * Dont read this array from your calling code, but use the \PackageVersions\Versions::getVersion() method instead.
     *
     * @var array<string, string>
     * @internal
     */
    const VERSIONS          = array (
  'cboden/ratchet' => 'v0.4.3@466a0ecc83209c75b76645eb823401b5c52e5f21',
  'composer/package-versions-deprecated' => '1.11.99.1@7413f0b55a051e89485c5cb9f765fe24bb02a7b6',
  'doctrine/annotations' => '1.13.1@e6e7b7d5b45a2f2abc5460cc6396480b2b1d321f',
  'doctrine/cache' => '1.11.0@a9c1b59eba5a08ca2770a76eddb88922f504e8e0',
  'doctrine/collections' => '1.6.7@55f8b799269a1a472457bd1a41b4f379d4cfba4a',
  'doctrine/common' => '3.1.2@a036d90c303f3163b5be8b8fde9b6755b2be4a3a',
  'doctrine/dbal' => '2.13.1@c800380457948e65bbd30ba92cc17cda108bf8c9',
  'doctrine/deprecations' => 'v0.5.3@9504165960a1f83cc1480e2be1dd0a0478561314',
  'doctrine/doctrine-bundle' => '2.3.2@d6b3c37804539a24ba8a7d647a6144cab2f13242',
  'doctrine/doctrine-migrations-bundle' => '3.1.1@91f0a5e2356029575f3038432cc188b12f9d5da5',
  'doctrine/event-manager' => '1.1.1@41370af6a30faa9dc0368c4a6814d596e81aba7f',
  'doctrine/inflector' => '2.0.3@9cf661f4eb38f7c881cac67c75ea9b00bf97b210',
  'doctrine/instantiator' => '1.4.0@d56bf6102915de5702778fe20f2de3b2fe570b5b',
  'doctrine/lexer' => '1.2.1@e864bbf5904cb8f5bb334f99209b48018522f042',
  'doctrine/migrations' => '3.1.2@1c2780df6b58998f411e64973cfa464ba0a06e00',
  'doctrine/orm' => '2.8.4@a588555ecd837b8d7e89355d9a13902e54d529c7',
  'doctrine/persistence' => '2.2.0@08d3e6e666de85c7748fa27bfd63bb15ac29eab2',
  'doctrine/sql-formatter' => '1.1.1@56070bebac6e77230ed7d306ad13528e60732871',
  'egulias/email-validator' => '3.1.1@c81f18a3efb941d8c4d2e025f6183b5c6d697307',
  'evenement/evenement' => 'v3.0.1@531bfb9d15f8aa57454f5f0285b18bec903b8fb7',
  'friendsofphp/proxy-manager-lts' => 'v1.0.3@121af47c9aee9c03031bdeca3fac0540f59aa5c3',
  'guzzlehttp/psr7' => '1.8.2@dc960a912984efb74d0a90222870c72c87f10c91',
  'laminas/laminas-code' => '4.3.0@1beb4447f9efd26041eba7eff50614e798c353fd',
  'laminas/laminas-eventmanager' => '3.3.1@966c859b67867b179fde1eff0cd38df51472ce4a',
  'laminas/laminas-zendframework-bridge' => '1.2.0@6cccbddfcfc742eb02158d6137ca5687d92cee32',
  'psr/cache' => '2.0.0@213f9dbc5b9bfbc4f8db86d2838dc968752ce13b',
  'psr/container' => '1.1.1@8622567409010282b7aeebe4bb841fe98b58dcaf',
  'psr/event-dispatcher' => '1.0.0@dbefd12671e8a14ec7f180cab83036ed26714bb0',
  'psr/http-message' => '1.0.1@f6561bf28d520154e4b0ec72be95418abe6d9363',
  'psr/log' => '1.1.3@0f73288fd15629204f9d42b7055f72dacbe811fc',
  'ralouphie/getallheaders' => '3.0.3@120b605dfeb996808c31b6477290a714d356e822',
  'ratchet/rfc6455' => 'v0.3@c8651c7938651c2d55f5d8c2422ac5e57a183341',
  'react/cache' => 'v1.1.1@4bf736a2cccec7298bdf745db77585966fc2ca7e',
  'react/dns' => 'v1.5.0@b22b0b20278e8535e633ab71a52472c5bf620aa1',
  'react/event-loop' => 'v1.1.1@6d24de090cd59cfc830263cfba965be77b563c13',
  'react/promise' => 'v2.8.0@f3cff96a19736714524ca0dd1d4130de73dbbbc4',
  'react/promise-timer' => 'v1.6.0@daee9baf6ef30c43ea4c86399f828bb5f558f6e6',
  'react/socket' => 'v1.6.0@e2b96b23a13ca9b41ab343268dbce3f8ef4d524a',
  'react/stream' => 'v1.1.1@7c02b510ee3f582c810aeccd3a197b9c2f52ff1a',
  'symfony/apache-pack' => 'v1.0.1@3aa5818d73ad2551281fc58a75afd9ca82622e6c',
  'symfony/asset' => 'v5.2.10@c65584ca108c9e51c80cc49ebdcb47dfd995431c',
  'symfony/cache' => 'v5.2.6@093d69bb10c959553c8beb828b8d4ea250a247dd',
  'symfony/cache-contracts' => 'v2.4.0@c0446463729b89dd4fa62e9aeecc80287323615d',
  'symfony/config' => 'v5.2.4@212d54675bf203ff8aef7d8cee8eecfb72f4a263',
  'symfony/console' => 'v5.2.6@35f039df40a3b335ebf310f244cb242b3a83ac8d',
  'symfony/dependency-injection' => 'v5.2.6@1e66194bed2a69fa395d26bf1067e5e34483afac',
  'symfony/deprecation-contracts' => 'v2.4.0@5f38c8804a9e97d23e0c8d63341088cd8a22d627',
  'symfony/doctrine-bridge' => 'v5.2.7@6c8318bb9b315d3d325e9904445e4c4514e3d8ed',
  'symfony/dotenv' => 'v5.2.4@783f12027c6b40ab0e93d6136d9f642d1d67cd6b',
  'symfony/error-handler' => 'v5.2.6@bdb7fb4188da7f4211e4b88350ba0dfdad002b03',
  'symfony/event-dispatcher' => 'v5.2.4@d08d6ec121a425897951900ab692b612a61d6240',
  'symfony/event-dispatcher-contracts' => 'v2.4.0@69fee1ad2332a7cbab3aca13591953da9cdb7a11',
  'symfony/filesystem' => 'v5.2.6@8c86a82f51658188119e62cff0a050a12d09836f',
  'symfony/finder' => 'v5.2.4@0d639a0943822626290d169965804f79400e6a04',
  'symfony/flex' => 'v1.12.2@e472606b4b3173564f0edbca8f5d32b52fc4f2c9',
  'symfony/form' => 'v5.2.8@10279a74e83eb21c4b980e5aeaeda3d30d214c16',
  'symfony/framework-bundle' => 'v5.2.6@8889da18c6faa76c6149a90e6542be4afe723f2f',
  'symfony/http-client-contracts' => 'v2.4.0@7e82f6084d7cae521a75ef2cb5c9457bbda785f4',
  'symfony/http-foundation' => 'v5.2.4@54499baea7f7418bce7b5ec92770fd0799e8e9bf',
  'symfony/http-kernel' => 'v5.2.6@f34de4c61ca46df73857f7f36b9a3805bdd7e3b2',
  'symfony/intl' => 'v5.2.7@6d40be5e4331041aa14add5633986d95667ae624',
  'symfony/mailer' => 'v5.2.7@c50b304246e56c8574c203bce440f0eafb107ae9',
  'symfony/mime' => 'v5.2.7@7af452bf51c46f18da00feb32e1ad36db9426515',
  'symfony/options-resolver' => 'v5.2.4@5d0f633f9bbfcf7ec642a2b5037268e61b0a62ce',
  'symfony/polyfill-intl-grapheme' => 'v1.22.1@5601e09b69f26c1828b13b6bb87cb07cddba3170',
  'symfony/polyfill-intl-icu' => 'v1.22.1@af1842919c7e7364aaaa2798b29839e3ba168588',
  'symfony/polyfill-intl-idn' => 'v1.22.1@2d63434d922daf7da8dd863e7907e67ee3031483',
  'symfony/polyfill-intl-normalizer' => 'v1.22.1@43a0283138253ed1d48d352ab6d0bdb3f809f248',
  'symfony/polyfill-mbstring' => 'v1.22.1@5232de97ee3b75b0360528dae24e73db49566ab1',
  'symfony/polyfill-php73' => 'v1.22.1@a678b42e92f86eca04b7fa4c0f6f19d097fb69e2',
  'symfony/polyfill-php80' => 'v1.22.1@dc3063ba22c2a1fd2f45ed856374d79114998f91',
  'symfony/property-access' => 'v5.2.4@3af8ed262bd3217512a13b023981fe68f36ad5f3',
  'symfony/property-info' => 'v5.2.8@cc8121baf91039648d5f8feb894dc4a9d4935cc0',
  'symfony/proxy-manager-bridge' => 'v5.2.4@fd6bb40190b1719abbe831be09adf38e0744d5f5',
  'symfony/routing' => 'v5.2.6@31fba555f178afd04d54fd26953501b2c3f0c6e6',
  'symfony/security-bundle' => 'v5.2.8@dbb555941ea0f6a461e4d26ed4e20dad73991cf4',
  'symfony/security-core' => 'v5.2.8@216b19421aa3b414f18f353aeea0bb230827844c',
  'symfony/security-csrf' => 'v5.2.7@0ed3353e3c053711a1d86a74395f25736fc333de',
  'symfony/security-guard' => 'v5.2.8@8137325674edfdecf7367e40804d8ee9525b87e0',
  'symfony/security-http' => 'v5.2.8@c55a8f70fb2a04cf8ec3263d337abb3f22fc0132',
  'symfony/service-contracts' => 'v2.4.0@f040a30e04b57fbcc9c6cbcf4dbaa96bd318b9bb',
  'symfony/stopwatch' => 'v5.2.7@d99310c33e833def36419c284f60e8027d359678',
  'symfony/string' => 'v5.2.6@ad0bd91bce2054103f5eaa18ebeba8d3bc2a0572',
  'symfony/translation-contracts' => 'v2.4.0@95c812666f3e91db75385749fe219c5e494c7f95',
  'symfony/twig-bridge' => 'v5.2.8@dcdc60ace03264f50258978113c4f2a33bdc439f',
  'symfony/twig-bundle' => 'v5.2.4@5ebbb5f0e8bfaa0b4b37cb25ff97f83b18caf221',
  'symfony/validator' => 'v5.2.7@b0be0360bfbf15059308d815da7f4151bd448b37',
  'symfony/var-dumper' => 'v5.2.6@89412a68ea2e675b4e44f260a5666729f77f668e',
  'symfony/var-exporter' => 'v5.2.4@5aed4875ab514c8cb9b6ff4772baa25fa4c10307',
  'symfony/yaml' => 'v5.2.5@298a08ddda623485208506fcee08817807a251dd',
  'symfonycasts/verify-email-bundle' => 'v1.5.0@8c21aa9aa6b7123afed213e72485e8dad75e5dcf',
  'twig/extra-bundle' => 'v3.3.1@e12a8ee63387abb83fb7e4c897663bfb94ac22b6',
  'twig/twig' => 'v3.3.2@21578f00e83d4a82ecfa3d50752b609f13de6790',
  'doctrine/data-fixtures' => '1.5.0@51d3d4880d28951fff42a635a2389f8c63baddc5',
  'doctrine/doctrine-fixtures-bundle' => '3.4.0@870189619a7770f468ffb0b80925302e065a3b34',
  'nikic/php-parser' => 'v4.10.5@4432ba399e47c66624bc73c8c0f811e5c109576f',
  'symfony/maker-bundle' => 'v1.31.1@4f57a44cef0b4555043160b8bf223fcde8a7a59a',
  'symfony/polyfill-ctype' => '*@',
  'symfony/polyfill-iconv' => '*@',
  'symfony/polyfill-php72' => '*@',
  '__root__' => '1.0.0+no-version-set@',
);

    private function __construct()
    {
    }

    /**
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function rootPackageName() : string
    {
        if (!class_exists(InstalledVersions::class, false) || !InstalledVersions::getRawData()) {
            return self::ROOT_PACKAGE_NAME;
        }

        return InstalledVersions::getRootPackage()['name'];
    }

    /**
     * @throws OutOfBoundsException If a version cannot be located.
     *
     * @psalm-param key-of<self::VERSIONS> $packageName
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function getVersion(string $packageName): string
    {
        if (class_exists(InstalledVersions::class, false) && InstalledVersions::getRawData()) {
            return InstalledVersions::getPrettyVersion($packageName)
                . '@' . InstalledVersions::getReference($packageName);
        }

        if (isset(self::VERSIONS[$packageName])) {
            return self::VERSIONS[$packageName];
        }

        throw new OutOfBoundsException(
            'Required package "' . $packageName . '" is not installed: check your ./vendor/composer/installed.json and/or ./composer.lock files'
        );
    }
}
