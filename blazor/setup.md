# Blazor .NET 10 setup 

## Generate a project from VS 2026 Insiders as it only supports .NET10 Preview.


## To use MariaDB or MySQL with EntityFramework

https://github.com/PomeloFoundation/Pomelo.EntityFrameworkCore.MySql/blob/main/README.md#2-services-configuration

## .csproj

```
<ItemGroup>
	<PackageReference Include="Microsoft.Build.Tasks.Core" Version="17.14.28" />
	<PackageReference Include="Microsoft.EntityFrameworkCore" Version="10.0.0-preview.6.25358.103" />
	<PackageReference Include="Microsoft.EntityFrameworkCore.Relational" Version="10.0.0-preview.6.25358.103" />
	<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="10.0.0-preview.6.25358.103">
		<IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
		<PrivateAssets>all</PrivateAssets>
	</PackageReference>
	<PackageReference Include="Pomelo.EntityFrameworkCore.MySql" Version="9.0.0" />
</ItemGroup>
```

## appsettings.json

```
"ConnectionStrings": {
  "MysqlConnection": "server=192.168.168.102;user=root;password=mysecretpassword;database=reepolee"
},
```

## terminal

```sh
dotnet ef dbcontext scaffold "Name=ConnectionStrings:MysqlConnection" Pomelo.EntityFrameworkCore.MySql --output-dir Models --context-dir Data --table users
```

## http file to test endpoints

```
@HostAddress = https://localhost:7250

GET {{HostAddress}}/api/users
Accept: application/json

###

```
